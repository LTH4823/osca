package org.zerock.oscatest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.oscatest.domain.Contract;
import org.zerock.oscatest.dto.ContractDTO;
import org.zerock.oscatest.dto.ListDTO;
import org.zerock.oscatest.dto.ListResponseDTO;
import org.zerock.oscatest.mapper.ContractMapper;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ContractServiceImpl implements ContractService {

    private final ContractMapper contractMapper;
    private final ModelMapper modelMapper;

    @Override
    public ListResponseDTO<ContractDTO> getList(ListDTO listDTO) {

        List<Contract> contractList = contractMapper.contractAuctionList(listDTO);

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
                .memId(contractDTO.getMemId())
                .comId(contractDTO.getComId())
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
                .memId(contractDTO.getMemId())
                .comId(contractDTO.getComId())
                .conState(contractDTO.getConState())
                .build());
    }

    @Override
    public void remove(Integer cnoNo) {
        contractMapper.updateAsRemove(cnoNo);
    }
}
