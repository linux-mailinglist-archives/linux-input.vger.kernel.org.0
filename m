Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17473392C0B
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 12:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236223AbhE0Kn7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 06:43:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64656 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236199AbhE0Kn7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 06:43:59 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14RAg9Yu022172;
        Thu, 27 May 2021 10:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=VYN5Qm74A0IeBDRpO2obuOc0RN4XTuJZkF9qaPFQZnY=;
 b=y5RGQO1/cQ4+JsHVIrohd00mAa88JGNhWa3jZM24jsrykHsq5BKjENusQmpv3PP9k1cj
 btjCsbxbm1+0WbmKPCtClecGkaxXO/XlJmO1h1idZBo70Nsuk384QG7cYJSgo+nQzjXo
 GJ4DNzSp4dEcJqdSztVq8KXhc/LahZb0SrUG+8Z8UEFG1Dr+DuzVmurbFa+LgxtXgJtF
 7YcQ+jbYq3XvzaSdm/9tVpd5cD65GR3yGbEQ3SjnfD2E4W7xkFl5fFZqdGAIm1yiAlLd
 CtC/x9iZNlwZ2ijS0Mu5eBe/i6q3Y7ltkYmpOjkCmiL2GR94oE0X/sVbd7L4YR2V6vCi bQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 38ssybrapm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 May 2021 10:42:08 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14RAg76a057231;
        Thu, 27 May 2021 10:42:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38pq2w9gsc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 May 2021 10:42:07 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14RAg72v057207;
        Thu, 27 May 2021 10:42:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 38pq2w9grw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 May 2021 10:42:06 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14RAg4Ej003415;
        Thu, 27 May 2021 10:42:04 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 27 May 2021 03:42:04 -0700
Date:   Thu, 27 May 2021 13:41:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     kbuild@lists.01.org, lkp@intel.com, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [input:next 2732/2735]
 drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error:
 uninitialized symbol 'z2'.
Message-ID: <20210527104157.GK24442@kadam>
References: <202105270957.mdv83Usm-lkp@intel.com>
 <20210527101951.5q5ixq2tnd7esq2w@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527101951.5q5ixq2tnd7esq2w@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: ZZN7H7TwIvq3Ko_fHz23bIzQfWNguvs9
X-Proofpoint-GUID: ZZN7H7TwIvq3Ko_fHz23bIzQfWNguvs9
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 27, 2021 at 12:19:51PM +0200, Oleksij Rempel wrote:
> Hi,
> 
> On Thu, May 27, 2021 at 12:30:00PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git  next
> > head:   6cf3b3abbf0b3b778138c0f8936aa7820af62cfc
> > commit: fb082cd59afa7fbd3a610e9835050675040b1b99 [2732/2735] Input: resistive-adc-touch - add support for z1 and z2 channels
> > config: x86_64-randconfig-m001-20210526 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > New smatch warnings:
> > drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error: uninitialized symbol 'z2'.
> > drivers/input/touchscreen/resistive-adc-touch.c:88 grts_cb() error: uninitialized symbol 'x'.
> > drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: uninitialized symbol 'y'.
> > 
> > Old smatch warnings:
> > drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: uninitialized symbol 'x'.
> > drivers/input/touchscreen/resistive-adc-touch.c:109 grts_cb() error: uninitialized symbol 'y'.
> > 
> > vim +/z2 +84 drivers/input/touchscreen/resistive-adc-touch.c
> > 
> > aa132ffb6b0a18 Eugen Hristev  2018-05-22   56  static int grts_cb(const void *data, void *private)
> > aa132ffb6b0a18 Eugen Hristev  2018-05-22   57  {
> > aa132ffb6b0a18 Eugen Hristev  2018-05-22   58  	const u16 *touch_info = data;
> > aa132ffb6b0a18 Eugen Hristev  2018-05-22   59  	struct grts_state *st = private;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   60  	unsigned int x, y, press = 0, z1 = 0, z2;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   61  	unsigned int Rt, i;
> > aa132ffb6b0a18 Eugen Hristev  2018-05-22   62  
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   63  	for (i = 0; i < ARRAY_SIZE(st->ch) && st->ch[i] != GRTS_CH_NONE; i++) {
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   64  		switch (st->ch[i]) {
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   65  		case GRTS_CH_X:
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   66  			x = touch_info[i];
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   67  			break;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   68  		case GRTS_CH_Y:
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   69  			y = touch_info[i];
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   70  			break;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   71  		case GRTS_CH_PRESSURE:
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   72  			press = touch_info[i];
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   73  			break;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   74  		case GRTS_CH_Z1:
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   75  			z1 = touch_info[i];
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   76  			break;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   77  		case GRTS_CH_Z2:
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   78  			z2 = touch_info[i];
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   79  			break;
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   80  		}
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   81  	}
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   82  
> > fb082cd59afa7f Oleksij Rempel 2021-05-25   83  	if (z1) {
> > fb082cd59afa7f Oleksij Rempel 2021-05-25  @84  		Rt = z2;
> > 
> > It's likely this is a false positive, but we can see why the static
> > checker would complain.
> 
> The presence of this values was validated on probe. Do we really need
> extra set them to 0?

You don't need to do anything.  ;)  These are a one time email.  I just
look it over and hit forward.

Currently GCC's uninitialized variable checking is disabled in the
kernel otherwise there would be more presure to silence the checker
warning.

regards,
dan carpenter

