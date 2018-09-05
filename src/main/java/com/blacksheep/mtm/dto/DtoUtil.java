package com.blacksheep.mtm.dto;

import com.blacksheep.mtm.pojo.common.ZTreeNode;
import com.blacksheep.mtm.dto.front.CartProduct;
import com.blacksheep.mtm.dto.front.Member;
import com.blacksheep.mtm.dto.front.Product;
import com.blacksheep.mtm.pojo.manager.*;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;


/**
 * @author   Z
 * @date 2017/8/25
 */
public class DtoUtil{

    private final static Logger log= LoggerFactory.getLogger(DtoUtil.class);

    public static TbMember MemberDto2Member(MemberDto memberDto){

        TbMember tbMember =new TbMember();

        if(!memberDto.getUsername().isEmpty()){
            tbMember.setUsername(memberDto.getUsername());
        }
        if(!memberDto.getPassword().isEmpty()){
            tbMember.setPassword(memberDto.getPassword());
        }
        if(!memberDto.getPhone().isEmpty()){
            tbMember.setPhone(memberDto.getPhone());
        }
        if(!memberDto.getEmail().isEmpty()){
            tbMember.setEmail(memberDto.getEmail());
        }
        if(!memberDto.getSex().isEmpty()){
            tbMember.setSex(memberDto.getSex());
        }
        return tbMember;
    }

    public static TbItem ItemDto2TbItem(ItemDto itemDto){

        TbItem tbItem =new TbItem();

        tbItem.setTitle(itemDto.getTitle());
        tbItem.setPrice(itemDto.getPrice());
        tbItem.setCid(itemDto.getCid());
        tbItem.setImage(itemDto.getImage());
        tbItem.setSellPoint(itemDto.getSellPoint());
        tbItem.setNum(itemDto.getNum());
        tbItem.setClassTime(itemDto.getClassTime());
        if(itemDto.getLimitNum()==null||itemDto.getLimitNum()<0){
            tbItem.setLimitNum(10);
        }else{
            tbItem.setLimitNum(itemDto.getLimitNum());
        }

        return tbItem;
    }

    public static ItemDto TbItem2ItemDto(TbItem tbItem){

        ItemDto itemDto =new ItemDto();

        itemDto.setTitle(tbItem.getTitle());
        itemDto.setPrice(tbItem.getPrice());
        itemDto.setCid(tbItem.getCid());
        itemDto.setImage(tbItem.getImage());
        itemDto.setSellPoint(tbItem.getSellPoint());
        itemDto.setNum(tbItem.getNum());
        itemDto.setClassTime(tbItem.getClassTime());
        if(tbItem.getLimitNum()==null){
            itemDto.setLimitNum(tbItem.getNum());
        }else if(tbItem.getLimitNum()<0&&tbItem.getNum()<0) {
            itemDto.setLimitNum(10);
        }else{
            itemDto.setLimitNum(tbItem.getLimitNum());
        }

        return itemDto;
    }


    public static ZTreeNode TbPanel2ZTreeNode(TbPanel tbPanel){

        ZTreeNode zTreeNode =new ZTreeNode();

        zTreeNode.setId(tbPanel.getId());
        zTreeNode.setIsParent(false);
        zTreeNode.setpId(0);
        zTreeNode.setName(tbPanel.getName());
        zTreeNode.setSortOrder(tbPanel.getSortOrder());
        zTreeNode.setStatus(tbPanel.getStatus());
        zTreeNode.setRemark(tbPanel.getRemark());
        zTreeNode.setLimitNum(tbPanel.getLimitNum());
        zTreeNode.setType(tbPanel.getType());

        return zTreeNode;
    }


    public static ZTreeNode TbItemCat2ZTreeNode(TbItemCat tbItemCat){

        ZTreeNode zTreeNode =new ZTreeNode();

        zTreeNode.setId(Math.toIntExact(tbItemCat.getId()));
        zTreeNode.setStatus(tbItemCat.getStatus());
        zTreeNode.setSortOrder(tbItemCat.getSortOrder());
        zTreeNode.setName(tbItemCat.getName());
        zTreeNode.setpId(Math.toIntExact(tbItemCat.getParentId()));
        zTreeNode.setIsParent(tbItemCat.getIsParent());
        zTreeNode.setRemark(tbItemCat.getRemark());

        return zTreeNode;
    }

    public static Product TbItem2Product(TbItem tbItem){

        Product product =new Product();

        product.setProductId(tbItem.getId());
        product.setProductName(tbItem.getTitle());
        product.setSalePrice(tbItem.getPrice());
        product.setSubTitle(tbItem.getSellPoint());
        product.setProductImageBig(tbItem.getImages()[0]);

        return product;
    }

    public static Member TbMemer2Member(TbMember tbMemer){

        Member member =new Member();

        member.setId(tbMemer.getId());
        member.setUsername(tbMemer.getUsername());
        member.setEmail(tbMemer.getEmail());
        member.setPhone(tbMemer.getPhone());
        member.setFile(tbMemer.getFile());
        member.setSex(tbMemer.getSex());

        return member;
    }

    public static CartProduct TbItem2CartProduct(TbItem tbItem){

        CartProduct cartProduct =new CartProduct();

        cartProduct.setProductId(tbItem.getId());
        cartProduct.setProductName(tbItem.getTitle());
        cartProduct.setSalePrice(tbItem.getPrice());
        cartProduct.setProductImg(tbItem.getImages()[0]);
        if(tbItem.getLimitNum()==null){
            cartProduct.setLimitNum(Long.valueOf(tbItem.getNum()));
        }else if(tbItem.getLimitNum()<0&&tbItem.getNum()<0) {
            cartProduct.setLimitNum((long) 10);
        }else{
            cartProduct.setLimitNum(Long.valueOf(tbItem.getLimitNum()));
        }
        return cartProduct;
    }

    public static CartProduct TbOrderItem2CartProduct(TbOrderItem tbOrderItem){

        CartProduct cartProduct=new CartProduct();
        cartProduct.setProductId(Long.valueOf(tbOrderItem.getItemId()));
        cartProduct.setProductName(tbOrderItem.getTitle());
        cartProduct.setSalePrice(tbOrderItem.getPrice());
        cartProduct.setProductNum(Long.valueOf(tbOrderItem.getNum()));
        cartProduct.setProductImg(tbOrderItem.getPicPath());

        return cartProduct;
    }

    public static CourseDto Course2CourseDto(TbCourse tbCourse){
        CourseDto courseDto = new CourseDto();
        courseDto.setCreateStamp(tbCourse.getCreateStamp());
        courseDto.setUpdateStamp(tbCourse.getUpdateStamp());
        courseDto.setDate(tbCourse.getDate().toString());
        courseDto.setTeacher(courseDto.getTeacher());
//        courseDto.setReserveTime(tbCourse.getReserveTime().);
        return courseDto;
    }

    public static TbCourse CourseDto2Course(CourseDto courseDto){
        TbCourse tbCourse = new TbCourse();
        tbCourse.setDate(courseDto.getDate());
        tbCourse.setTeacher(courseDto.getTeacher());
        StringBuilder stringBuilder = new StringBuilder();
        for (String a : courseDto.getReserveTime()){
            stringBuilder.append(a);
            stringBuilder.append(",");
        }
        tbCourse.setReserveTime(stringBuilder.toString().trim());
        tbCourse.setCreateStamp(courseDto.getCreateStamp());
        tbCourse.setUpdateStamp(courseDto.getUpdateStamp());
        return  tbCourse;
    }
    public static CourseReserveDto Reserve2ReserveDto(TbCourseReserve tbCourseReserve){
        CourseReserveDto courseReserveDto = new CourseReserveDto();
        courseReserveDto.settId(tbCourseReserve.gettId());
        courseReserveDto.setOrderId(tbCourseReserve.getOrderId());
        courseReserveDto.setStatus(tbCourseReserve.getStatus());
        courseReserveDto.setStuId(tbCourseReserve.getStuId());
        courseReserveDto.setUpdateStamp(tbCourseReserve.getUpdateStamp());
        courseReserveDto.setCreateStamp(tbCourseReserve.getCreateStamp());
        return  courseReserveDto;
    }

    public static TbNews NewsDto2TbNews(NewsDto newsDto){
        TbNews news = new TbNews();
        news.setId(newsDto.getId());
        news.setAuthorId(newsDto.getAuthorId());
        news.setCid(newsDto.getCid());
        news.setTitle(newsDto.getTitle());
        news.setPic(newsDto.getPic());
        news.setCreateStamp(newsDto.getCreateStamp());
        news.setUpdateStamp(newsDto.getUpdateStamp());
        return news;
    }

    public static NewsDto TbNews2NewsDto(TbNews news){
        NewsDto newsDto = new NewsDto();
        newsDto.setId(news.getId());
        newsDto.setAuthorId(news.getAuthorId());
        newsDto.setCid(news.getCid());
        newsDto.setTitle(news.getTitle());
        newsDto.setPic(news.getPic());
        newsDto.setCreateStamp(news.getCreateStamp());
        newsDto.setUpdateStamp(news.getUpdateStamp());
        return newsDto;
    }

    public static MemberFllowDto TbMemberFllow2MemberFllowDto(TbMemberFllow tbMemberFllow){
        MemberFllowDto memberFllowDto = new MemberFllowDto();

        return memberFllowDto;
    }
}
