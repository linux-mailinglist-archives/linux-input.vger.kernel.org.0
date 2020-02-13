Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFA515B9C8
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2020 07:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbgBMGxB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 01:53:01 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:52204 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgBMGxB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 01:53:01 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01D6qjLP066637;
        Thu, 13 Feb 2020 06:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=gDeVsJiTPxvZ1itRfcoCNccy33xDEZAZ6ELj1OHqOOA=;
 b=QNfQ+wdnbLqju8bjl1muGDaYdaMImdH1O7CJnMyZ7S1ueHSB6fRdc509y5GSjGuIsCfT
 7maBs7RQzuP+0HetaPVyTBLi1nZZlS13lJFreqc92JVInc1SPojdj72vDV/KU6UJgbLd
 V33QbjKipAP1OdOpkkYTQfRJOgv1orPp5gNeN/IPLQ0vcZixgegLecNYF2LDxghPb92B
 swJ8JOD7Qcqsu7Ls7YJpl7zl+BnIRKw/TcFNBqM80zAM0lGBnUmuUTfPpigmIbwmHdef
 uJawpEqNt02D/+Q/a45iDvwKOA8UcoUbmBVbYltxmcw7XK7jnVHRwL6V0LT3zNXf3cHz 4g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2y2jx6fvrr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 13 Feb 2020 06:52:45 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01D6lIrA100035;
        Thu, 13 Feb 2020 06:52:45 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2y4k34mj7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Feb 2020 06:52:45 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01D6qhQw018981;
        Thu, 13 Feb 2020 06:52:43 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 12 Feb 2020 22:52:40 -0800
Date:   Thu, 13 Feb 2020 09:52:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        Lars-Peter Clausen <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: Re: [PATCH v3 2/2] input: adp5589: Add basic devicetree support
Message-ID: <20200213065210.GE7838@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205142218.15973-2-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9529 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002130053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9529 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002130054
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alexandru,

url:    https://urldefense.com/v3/__https://github.com/0day-ci/linux/commits/Alexandru-Ardelean/input-adp5589-Add-default-platform-data/20200206-073944__;!!GqivPVa7Brio!MY2_vTOsanTGzkj1sG9gmxs-c72f_T0MK8vYxgXFLKcqgchKaYGVs4ZRunDQ5YstlQ$ 
base:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git__;!!GqivPVa7Brio!MY2_vTOsanTGzkj1sG9gmxs-c72f_T0MK8vYxgXFLKcqgchKaYGVs4ZRunDPI_jD3g$  next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/input/keyboard/adp5589-keys.c:1053 adp5589_probe() warn: possible memory leak of 'kpad'

Old smatch warnings:
drivers/input/keyboard/adp5589-keys.c:913 adp5589_keypad_add() error: we previously assumed 'pdata->gpimap' could be null (see line 902)

# https://urldefense.com/v3/__https://github.com/0day-ci/linux/commit/e537dc5175805cf765da36bdd9cafe98b0a191d9__;!!GqivPVa7Brio!MY2_vTOsanTGzkj1sG9gmxs-c72f_T0MK8vYxgXFLKcqgchKaYGVs4ZRunBH8qj3xg$ 
git remote add linux-review https://urldefense.com/v3/__https://github.com/0day-ci/linux__;!!GqivPVa7Brio!MY2_vTOsanTGzkj1sG9gmxs-c72f_T0MK8vYxgXFLKcqgchKaYGVs4ZRunDP90BKkw$ 
git remote update linux-review
git checkout e537dc5175805cf765da36bdd9cafe98b0a191d9
vim +/kpad +1053 drivers/input/keyboard/adp5589-keys.c

cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1030  static int adp5589_probe(struct i2c_client *client,
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1031  			 const struct i2c_device_id *id)
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1032  {
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1033  	struct adp5589_kpad *kpad;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1034  	const struct adp5589_kpad_platform_data *pdata =
ba322093a2bfbb Lars-Peter Clausen 2020-02-05  1035  		adp5589_kpad_pdata_get(&client->dev);
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1036  	unsigned int revid;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1037  	int error, ret;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1038  
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1039  	if (!i2c_check_functionality(client->adapter,
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1040  				     I2C_FUNC_SMBUS_BYTE_DATA)) {
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1041  		dev_err(&client->dev, "SMBUS Byte Data not Supported\n");
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1042  		return -EIO;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1043  	}
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1044  
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1045  	kpad = kzalloc(sizeof(*kpad), GFP_KERNEL);
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1046  	if (!kpad)
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1047  		return -ENOMEM;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1048  
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1049  	kpad->client = client;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1050  
e537dc5175805c Lars-Peter Clausen 2020-02-05  1051  	ret = adp5589_i2c_get_driver_data(client, id);
e537dc5175805c Lars-Peter Clausen 2020-02-05  1052  	if (ret < 0)
e537dc5175805c Lars-Peter Clausen 2020-02-05 @1053  		return ret;

	error = ret;
	goto err_free_mem;

Better to just delete the "error" variable though and make everything
ret.

e537dc5175805c Lars-Peter Clausen 2020-02-05  1054  
e537dc5175805c Lars-Peter Clausen 2020-02-05  1055  	switch (ret) {
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1056  	case ADP5585_02:
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1057  		kpad->support_row5 = true;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1058  		/* fall through */
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1059  	case ADP5585_01:
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1060  		kpad->is_adp5585 = true;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1061  		kpad->var = &const_adp5585;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1062  		break;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1063  	case ADP5589:
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1064  		kpad->support_row5 = true;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1065  		kpad->var = &const_adp5589;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1066  		break;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1067  	}
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1068  
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1069  	ret = adp5589_read(client, ADP5589_5_ID);
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1070  	if (ret < 0) {
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1071  		error = ret;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1072  		goto err_free_mem;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1073  	}
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1074  
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1075  	revid = (u8) ret & ADP5589_5_DEVICE_ID_MASK;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1076  
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1077  	if (pdata->keymapsize) {
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1078  		error = adp5589_keypad_add(kpad, revid);
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1079  		if (error)
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1080  			goto err_free_mem;
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1081  	}
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1082  
9d2e173644bb5c Michael Hennerich  2011-05-19  1083  	error = adp5589_setup(kpad);
9d2e173644bb5c Michael Hennerich  2011-05-19  1084  	if (error)
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1085  		goto err_keypad_remove;
9d2e173644bb5c Michael Hennerich  2011-05-19  1086  
9d2e173644bb5c Michael Hennerich  2011-05-19  1087  	if (kpad->gpimapsize)
9d2e173644bb5c Michael Hennerich  2011-05-19  1088  		adp5589_report_switch_state(kpad);
9d2e173644bb5c Michael Hennerich  2011-05-19  1089  
9d2e173644bb5c Michael Hennerich  2011-05-19  1090  	error = adp5589_gpio_add(kpad);
9d2e173644bb5c Michael Hennerich  2011-05-19  1091  	if (error)
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1092  		goto err_keypad_remove;
9d2e173644bb5c Michael Hennerich  2011-05-19  1093  
9d2e173644bb5c Michael Hennerich  2011-05-19  1094  	i2c_set_clientdata(client, kpad);
9d2e173644bb5c Michael Hennerich  2011-05-19  1095  
9d2e173644bb5c Michael Hennerich  2011-05-19  1096  	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq);
9d2e173644bb5c Michael Hennerich  2011-05-19  1097  	return 0;
9d2e173644bb5c Michael Hennerich  2011-05-19  1098  
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1099  err_keypad_remove:
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1100  	adp5589_keypad_remove(kpad);
3f48e735435851 Michael Hennerich  2011-10-18  1101  err_free_mem:
9d2e173644bb5c Michael Hennerich  2011-05-19  1102  	kfree(kpad);
9d2e173644bb5c Michael Hennerich  2011-05-19  1103  
9d2e173644bb5c Michael Hennerich  2011-05-19  1104  	return error;
9d2e173644bb5c Michael Hennerich  2011-05-19  1105  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://urldefense.com/v3/__https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org__;!!GqivPVa7Brio!MY2_vTOsanTGzkj1sG9gmxs-c72f_T0MK8vYxgXFLKcqgchKaYGVs4ZRunCDo3i4pw$ 
