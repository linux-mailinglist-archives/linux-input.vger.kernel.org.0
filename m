Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8744A3AFF9A
	for <lists+linux-input@lfdr.de>; Tue, 22 Jun 2021 10:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbhFVIwB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Jun 2021 04:52:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63044 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229656AbhFVIwB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Jun 2021 04:52:01 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15M8fUR0019955;
        Tue, 22 Jun 2021 08:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=XhJ9HUsn3xPjMIuibTZXUxuI6bKVA8L5PpwcAnVEO1Q=;
 b=VQFe1RUiS6aMqBQSg4eupQYiTWf+2te8XtiqdG8IH2T4Bs9n0sP8gjbUSjDWGBliSTWo
 aKRe1gD/1mQID21pnubB7RcZRplx2eAaaL5o/LEBaBrs9Yp7qU0pF8gdMAUdKclUFHcm
 jg0H1R0h4Cpu/fXyUlB04KaZ3n5KFcb8d0HI0KwtGqlJA8RCsRt7gqw4YOF8bj3M56+F
 1Je57Vv0bjBOjjwvz9Kz035cuZsroFT4yNoC5iPKHJE/SMdtLunlAGLqFK0W5+6lnXcf
 gqtc6EgAFHsTzqkBmNAKTw7oKBu0KZwiZR55vuMoFTUZzLFfz1CaW9FjUYOOK9WfNLbO /w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 39ap66jqxe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 08:49:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15M8jcSc037026;
        Tue, 22 Jun 2021 08:49:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 3996md2w77-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 08:49:39 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15M8lwBD043917;
        Tue, 22 Jun 2021 08:49:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 3996md2w6k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 08:49:39 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.14.4) with ESMTP id 15M8nc0q001772;
        Tue, 22 Jun 2021 08:49:38 GMT
Received: from kadam (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 22 Jun 2021 01:49:37 -0700
Date:   Tue, 22 Jun 2021 11:49:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: goodix: Tie the reset line to true state
 of the regulator
Message-ID: <202106221609.teM1w2T0-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611092847.1.I358cae5e33f742765fd38485d6ddf1a4a978644d@changeid>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: j_RLKXyuS-RVJC8scdw30G1TftFsVVFt
X-Proofpoint-GUID: j_RLKXyuS-RVJC8scdw30G1TftFsVVFt
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Douglas,

url:    https://github.com/0day-ci/linux/commits/Douglas-Anderson/HID-i2c-hid-goodix-Tie-the-reset-line-to-true-state-of-the-regulator/20210617-102450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
config: i386-randconfig-m021-20210622 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hid/i2c-hid/i2c-hid-of-goodix.c:151 i2c_hid_of_goodix_probe() warn: inconsistent returns '&ihid_goodix->regulator_mutex'.

vim +151 drivers/hid/i2c-hid/i2c-hid-of-goodix.c

c1ed18c11bdb80 Douglas Anderson 2021-01-15   95  static int i2c_hid_of_goodix_probe(struct i2c_client *client,
c1ed18c11bdb80 Douglas Anderson 2021-01-15   96  				   const struct i2c_device_id *id)
c1ed18c11bdb80 Douglas Anderson 2021-01-15   97  {
c1ed18c11bdb80 Douglas Anderson 2021-01-15   98  	struct i2c_hid_of_goodix *ihid_goodix;
2b87ff72c696bc Douglas Anderson 2021-06-11   99  	int ret;
c1ed18c11bdb80 Douglas Anderson 2021-01-15  100  	ihid_goodix = devm_kzalloc(&client->dev, sizeof(*ihid_goodix),
c1ed18c11bdb80 Douglas Anderson 2021-01-15  101  				   GFP_KERNEL);
c1ed18c11bdb80 Douglas Anderson 2021-01-15  102  	if (!ihid_goodix)
c1ed18c11bdb80 Douglas Anderson 2021-01-15  103  		return -ENOMEM;
c1ed18c11bdb80 Douglas Anderson 2021-01-15  104  
2b87ff72c696bc Douglas Anderson 2021-06-11  105  	mutex_init(&ihid_goodix->regulator_mutex);
2b87ff72c696bc Douglas Anderson 2021-06-11  106  
c1ed18c11bdb80 Douglas Anderson 2021-01-15  107  	ihid_goodix->ops.power_up = goodix_i2c_hid_power_up;
c1ed18c11bdb80 Douglas Anderson 2021-01-15  108  	ihid_goodix->ops.power_down = goodix_i2c_hid_power_down;
c1ed18c11bdb80 Douglas Anderson 2021-01-15  109  
c1ed18c11bdb80 Douglas Anderson 2021-01-15  110  	/* Start out with reset asserted */
c1ed18c11bdb80 Douglas Anderson 2021-01-15  111  	ihid_goodix->reset_gpio =
c1ed18c11bdb80 Douglas Anderson 2021-01-15  112  		devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
c1ed18c11bdb80 Douglas Anderson 2021-01-15  113  	if (IS_ERR(ihid_goodix->reset_gpio))
c1ed18c11bdb80 Douglas Anderson 2021-01-15  114  		return PTR_ERR(ihid_goodix->reset_gpio);
c1ed18c11bdb80 Douglas Anderson 2021-01-15  115  
c1ed18c11bdb80 Douglas Anderson 2021-01-15  116  	ihid_goodix->vdd = devm_regulator_get(&client->dev, "vdd");
c1ed18c11bdb80 Douglas Anderson 2021-01-15  117  	if (IS_ERR(ihid_goodix->vdd))
c1ed18c11bdb80 Douglas Anderson 2021-01-15  118  		return PTR_ERR(ihid_goodix->vdd);
c1ed18c11bdb80 Douglas Anderson 2021-01-15  119  
c1ed18c11bdb80 Douglas Anderson 2021-01-15  120  	ihid_goodix->timings = device_get_match_data(&client->dev);
c1ed18c11bdb80 Douglas Anderson 2021-01-15  121  
2b87ff72c696bc Douglas Anderson 2021-06-11  122  	/*
2b87ff72c696bc Douglas Anderson 2021-06-11  123  	 * We need to control the "reset" line in lockstep with the regulator
2b87ff72c696bc Douglas Anderson 2021-06-11  124  	 * actually turning on an off instead of just when we make the request.
2b87ff72c696bc Douglas Anderson 2021-06-11  125  	 * This matters if the regulator is shared with another consumer.
2b87ff72c696bc Douglas Anderson 2021-06-11  126  	 * - If the regulator is off then we must assert reset. The reset
2b87ff72c696bc Douglas Anderson 2021-06-11  127  	 *   line is active low and on some boards it could cause a current
2b87ff72c696bc Douglas Anderson 2021-06-11  128  	 *   leak if left high.
2b87ff72c696bc Douglas Anderson 2021-06-11  129  	 * - If the regulator is on then we don't want reset asserted for very
2b87ff72c696bc Douglas Anderson 2021-06-11  130  	 *   long. Holding the controller in reset apparently draws extra
2b87ff72c696bc Douglas Anderson 2021-06-11  131  	 *   power.
2b87ff72c696bc Douglas Anderson 2021-06-11  132  	 */
2b87ff72c696bc Douglas Anderson 2021-06-11  133  	mutex_lock(&ihid_goodix->regulator_mutex);
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
2b87ff72c696bc Douglas Anderson 2021-06-11  134  	ihid_goodix->nb.notifier_call = ihid_goodix_vdd_notify;
2b87ff72c696bc Douglas Anderson 2021-06-11  135  	ret = regulator_register_notifier(ihid_goodix->vdd, &ihid_goodix->nb);
2b87ff72c696bc Douglas Anderson 2021-06-11  136  	if (ret)
2b87ff72c696bc Douglas Anderson 2021-06-11  137  		return dev_err_probe(&client->dev, ret,
2b87ff72c696bc Douglas Anderson 2021-06-11  138  			"regulator notifier request failed\n");
                                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Drop the lock before returning?

2b87ff72c696bc Douglas Anderson 2021-06-11  139  
2b87ff72c696bc Douglas Anderson 2021-06-11  140  	/*
2b87ff72c696bc Douglas Anderson 2021-06-11  141  	 * If someone else is holding the regulator on (or the regulator is
2b87ff72c696bc Douglas Anderson 2021-06-11  142  	 * an always-on one) we might never be told to deassert reset. Do it
2b87ff72c696bc Douglas Anderson 2021-06-11  143  	 * now. Here we'll assume that someone else might have _just
2b87ff72c696bc Douglas Anderson 2021-06-11  144  	 * barely_ turned the regulator on so we'll do the full
2b87ff72c696bc Douglas Anderson 2021-06-11  145  	 * "post_power_delay" just in case.
2b87ff72c696bc Douglas Anderson 2021-06-11  146  	 */
2b87ff72c696bc Douglas Anderson 2021-06-11  147  	if (ihid_goodix->reset_gpio && regulator_is_enabled(ihid_goodix->vdd))
2b87ff72c696bc Douglas Anderson 2021-06-11  148  		goodix_i2c_hid_deassert_reset(ihid_goodix, true);
2b87ff72c696bc Douglas Anderson 2021-06-11  149  	mutex_unlock(&ihid_goodix->regulator_mutex);
2b87ff72c696bc Douglas Anderson 2021-06-11  150  
c1ed18c11bdb80 Douglas Anderson 2021-01-15 @151  	return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001);
c1ed18c11bdb80 Douglas Anderson 2021-01-15  152  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

