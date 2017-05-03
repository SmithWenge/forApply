package com.caifeng.function.admin.home.service;

import com.caifeng.function.admin.home.Home;
import com.caifeng.function.admin.home.repository.HomeRepositoryI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class HomeService implements HomeServiceI {
    @Autowired
    private HomeRepositoryI homeRepository;
    @Override
    public Home selectNumsForHome() {
        Home home = new Home();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        home.setNowaday(sdf.format(new Date()));
        home.setNumOfNowaday(homeRepository.selectNumsForHome(home));

        home.setListState(1);
        home.setNumOfDayUnShenhe(homeRepository.selectNumsForHome(home));

        home.setListState(2);
        home.setNumOfDayShenheSuccess(homeRepository.selectNumsForHome(home));

        home.setListState(3);
        home.setNumOfDayShenHeFailed(homeRepository.selectNumsForHome(home));

        home.setNowaday(null);
        home.setNumOfList(homeRepository.selectNumsForHome(home));

        home.setListState(1);
        home.setNumOfUnShenhe(homeRepository.selectNumsForHome(home));

        home.setListState(2);
        home.setNumOfShenheSuccess(homeRepository.selectNumsForHome(home));

        home.setListState(3);
        home.setNumOfShenHeFailed(homeRepository.selectNumsForHome(home));

        return home;
    }
}
