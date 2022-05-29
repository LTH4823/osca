package org.zerock.oscatest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.oscatest.domain.Contract;
import org.zerock.oscatest.domain.Pick;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.mapper.ContractMapper;
import org.zerock.oscatest.mapper.FileMapper;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ContractServiceImpl implements ContractService {

    private final ContractMapper contractMapper;
    private final FileMapper fileMapper;
    private final ModelMapper modelMapper;

    @Override
    public void register(ContractDTO contractDTO) {

        Contract contract = modelMapper.map(contractDTO, Contract.class);

        List<Pick> files = contractDTO.getUploads().stream().map(uploadResultDTO
                -> modelMapper.map(uploadResultDTO, Pick.class)).collect(Collectors.toList());

        log.info("==================================");
        log.info(contract);
        log.info(files);
        contractMapper.insert(contract);

        files.forEach(file ->fileMapper.insert(file));

        log.info("==================================");
        log.info("==================================");

    }

    @Override
    public ListResponseDTO<ContractDTO> getList(ListDTO listDTO) {

        List<Contract> contractList = contractMapper.allList(listDTO);

        List<ContractDTO> dtoList =
                contractList.stream().map(contract -> modelMapper.map(contract, ContractDTO.class))
                        .collect(Collectors.toList());


        return ListResponseDTO.<ContractDTO>builder()
                .dtoList(dtoList)
                .total(contractMapper.getTotal(listDTO))
                .build();
    }

    @Override
    public ContractDTO getOne(Integer conNo) {

        Contract contract = contractMapper.getOne(conNo);

        ContractDTO contractDTO = modelMapper.map(contract, ContractDTO.class);

        return contractDTO;
    }

    @Override
    public void insert(ContractDTO contractDTO) {
        contractMapper.insert(Contract.builder()
                .conName(contractDTO.getConName())
                .conCategory(contractDTO.getConCategory())
                .conLocation(contractDTO.getConLocation())
                .conSpace(contractDTO.getConSpace())
                .conContent(contractDTO.getConContent())
                .conRequest(contractDTO.getConRequest())
                .conCondition(contractDTO.getConCondition())
                .conStartDay(contractDTO.getConStartDay())
                .conEndDay(contractDTO.getConEndDay())
                .conPrice(contractDTO.getConPrice())
                .conDocument(contractDTO.getConDocument())
                .conImg(contractDTO.getConImg())
                .requester(contractDTO.getRequester())
                .worker(contractDTO.getWorker())
                .conState(contractDTO.getConState())
                .build());
    }

    @Override
    public void update(ContractDTO contractDTO) {
        contractMapper.update(Contract.builder()
                .conNo(contractDTO.getConNo())
                .conName(contractDTO.getConName())
                .conCategory(contractDTO.getConCategory())
                .conLocation(contractDTO.getConLocation())
                .conSpace(contractDTO.getConSpace())
                .conContent(contractDTO.getConContent())
                .conRequest(contractDTO.getConRequest())
                .conCondition(contractDTO.getConCondition())
                .conStartDay(contractDTO.getConStartDay())
                .conEndDay(contractDTO.getConEndDay())
                .conPrice(contractDTO.getConPrice())
                .conDocument(contractDTO.getConDocument())
                .conImg(contractDTO.getConImg())
                .requester(contractDTO.getRequester())
                .worker(contractDTO.getWorker())
                .conState(contractDTO.getConState())
                .build());
    }

    @Override
    public void remove(Integer cnoNo) {
        contractMapper.updateAsRemove(cnoNo);
    }

    @Override
    public List<UploadResultDTO> getFiles(Integer conNo) {
        List<Pick> pickFiles = contractMapper.selectFiles(conNo);

        return pickFiles.stream()
                .map(pick -> modelMapper
                        .map(pick, UploadResultDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public ListResponseDTO<ContractDTO> getAddList(ContractListDTO contractListDTO) {

        List<Contract> contractList = contractMapper.addList(contractListDTO);

        List<ContractDTO> dtoList =
                contractList.stream().map(contract -> modelMapper.map(contract, ContractDTO.class))
                        .collect(Collectors.toList());


        return ListResponseDTO.<ContractDTO>builder()
                .dtoList(dtoList)
                .total(contractMapper.getContractTotal(contractListDTO))
                .build();
    }
}
