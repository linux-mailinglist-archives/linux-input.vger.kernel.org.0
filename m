Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F8A2B03B3
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbgKLLUK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:20:10 -0500
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:22700 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725966AbgKLLUJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:20:09 -0500
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0ACB6gaO011863;
        Thu, 12 Nov 2020 05:20:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=Gl5anvkay0Hl8K+gE6/jsdsHDasXe+rW/+AkdTfGKLA=;
 b=WS9K866dYZpbeogjugRPvD5jN4Z/saez1Z5CobZ5mN6X5WNOF1rBKRJ3z8G5boKiL4AA
 mJHAtphoLIuRnT+exWuMUJf3Id1b6MfjphBiMDOZMXbbKP2kyRXvtXA5DmvPFW0j9k95
 8/GXrx+phdYc1EFarDYkEYGI0RJlRivmgsDVTGdgbgTQaJ28wZIBX07U580dXkNtCxc2
 puIG5/pQxkxcRoIiaAVg6or6by6I8GbGIp2U52X5Sxl5V3huEPql3trsPoOJTslmcZHT
 whA0N/34fx8D7y3DpbGjvLyXeLOVnCOuMk61nNDY4twIjTfHbPiAVjJF/+857s9TsXGm OQ== 
Received: from ediex02.ad.cirrus.com ([5.172.152.52])
        by mx0a-001ae601.pphosted.com with ESMTP id 34rn2yh4wa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 12 Nov 2020 05:20:08 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 12 Nov
 2020 11:20:05 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 12 Nov 2020 11:20:05 +0000
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.168])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9FE622D1;
        Thu, 12 Nov 2020 11:20:05 +0000 (UTC)
Subject: Re: [PATCH 09/15] input: misc: wm831x-on: Source file headers are not
 good candidates for kernel-doc
To:     Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        <patches@opensource.cirrus.com>, <linux-input@vger.kernel.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-10-lee.jones@linaro.org>
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <fef4bf59-c28c-b838-e9c3-73bfad8429d1@opensource.cirrus.com>
Date:   Thu, 12 Nov 2020 11:20:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201112110204.2083435-10-lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 malwarescore=0 clxscore=1011 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120067
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12/11/2020 11:01, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/input/misc/wm831x-on.c:30: warning: cannot understand function prototype: 'struct wm831x_on '
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Cc: patches@opensource.cirrus.com
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/input/misc/wm831x-on.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/wm831x-on.c b/drivers/input/misc/wm831x-on.c
> index 1b44de265a0ad..a42fe041b73c6 100644
> --- a/drivers/input/misc/wm831x-on.c
> +++ b/drivers/input/misc/wm831x-on.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>    * wm831x-on.c - WM831X ON pin driver
>    *
>    * Copyright (C) 2009 Wolfson Microelectronics plc
> 

Acked-by: Richard Fitzgerald <rf@opensource.cirrus.com>
