package org.zerock.oscatest.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.oscatest.domain.Admin;
import org.zerock.oscatest.domain.Contract;
import org.zerock.oscatest.domain.Contractor;
import org.zerock.oscatest.domain.Requester;
import org.zerock.oscatest.dto.*;
import org.zerock.oscatest.mapper.AdminMapper;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class AdminServiceImpl implements AdminService{
    private final AdminMapper adminMapper;
    private final ModelMapper modelMapper;

    @Override
    public ListResponseDTO<AdminDTO> getAdminList(ListDTO listDTO) {
        List<Admin> adminList = adminMapper.selectAdminList(listDTO);

        List<AdminDTO> dtoList =
                adminList.stream().map(admin -> modelMapper.map(admin, AdminDTO.class))
                        .collect(Collectors.toList());

        return ListResponseDTO.<AdminDTO>builder()
                .dtoList(dtoList)
                .total(adminMapper.getAdminTotal(listDTO))
                .build();
    }

    @Override
    public ListResponseDTO<RequesterDTO> getRequesterList(ListDTO listDTO) {
        List<Requester> RequesterList = adminMapper.selectRequesterList(listDTO);

        List<RequesterDTO> dtoList =
                RequesterList.stream().map(requester -> modelMapper.map(requester, RequesterDTO.class))
                        .collect(Collectors.toList());

        return ListResponseDTO.<RequesterDTO>builder()
                .dtoList(dtoList)
                .total(adminMapper.getRequesterTotal(listDTO))
                .build();
    }

    @Override
    public ListResponseDTO<ContractDTO> getContractList(ListDTO listDTO) {
        List<Contract> collectorsList = adminMapper.selectContractList(listDTO);

        List<ContractDTO> dtoList =
                collectorsList.stream().map(contract -> modelMapper.map(contract, ContractDTO.class))
                        .collect(Collectors.toList());

        return ListResponseDTO.<ContractDTO>builder()
                .dtoList(dtoList)
                .total(adminMapper.getContractTotal(listDTO))
                .build();

    }

    @Override
    public ListResponseDTO<ContractorDTO> getContractorList(ListDTO listDTO) {
        List<Contractor> collectorsList = adminMapper.selectContractorList(listDTO);

        List<ContractorDTO> dtoList =
                collectorsList.stream().map(Contractor -> modelMapper.map(Contractor, ContractorDTO.class))
                        .collect(Collectors.toList());

        return ListResponseDTO.<ContractorDTO>builder()
                .dtoList(dtoList)
                .total(adminMapper.getContractorTotal(listDTO))
                .build();
    }

}
