Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E020A245F0
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 04:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfEUC1F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 May 2019 22:27:05 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57827 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbfEUC1F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 May 2019 22:27:05 -0400
Received: from [125.35.49.90] (helo=[10.0.0.21])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hSuUV-0003UZ-4L; Tue, 21 May 2019 02:26:59 +0000
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSBpbnB1dDogYWxwcy1maXggdGhlIGlz?=
 =?UTF-8?Q?sue_the_special_alps_trackpoint_do_not_work=2e?=
To:     Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Cc:     "pali.rohar@gmail.com" <pali.rohar@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
References: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
 <OSBPR01MB485510A2A32CD9D2CE5EF7A1DA070@OSBPR01MB4855.jpnprd01.prod.outlook.com>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <345b62e1-407e-7a03-9b03-486bbf5a0a8e@canonical.com>
Date:   Tue, 21 May 2019 10:26:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB485510A2A32CD9D2CE5EF7A1DA070@OSBPR01MB4855.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Tested-by: Hui Wang <hui.wang@canonical.com>

On 2019/5/21 上午9:07, Xiaoxiao Liu wrote:
> Add Pali Rohár.
>
> -----邮件原件-----
> 发件人: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> 发送时间: Monday, May 20, 2019 7:02 PM
> 收件人: dmitry.torokhov@gmail.com
> 抄送: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; hui.wang@canonical.com; 曹 曉建 Xiaojian Cao <xiaojian.cao@cn.alps.com>; zhangfp1@lenovo.com; 劉 曉曉 Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>; XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> 主题: [PATCH] input: alps-fix the issue the special alps trackpoint do not work.
>
> when the alps trackpoint is detected and using the alps_v8_protocol_data procotol, the alps driver will not report the input data.
>
> solution: use standard mouse driver instead of alps driver when the specail trackpoint was detected.
>
> Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> ---
>   drivers/input/mouse/alps.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c index 0a6f7ca883e7..516ae1d0eb17 100644
> --- a/drivers/input/mouse/alps.c
> +++ b/drivers/input/mouse/alps.c
> @@ -24,7 +24,7 @@
>   
>   #include "psmouse.h"
>   #include "alps.h"
> -
> +#include "trackpoint.h"
>   /*
>    * Definitions for ALPS version 3 and 4 command mode protocol
>    */
> @@ -2864,6 +2864,22 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
>   	return NULL;
>   }
>   
> +int alps_check_is_trackpoint(struct psmouse *psmouse) {
> +	u8 param[2] = { 0 };
> +	int error;
> +
> +	error = ps2_command(&psmouse->ps2dev,
> +			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
> +	if (error)
> +		return error;
> +
> +	if (param[0] == TP_VARIANT_ALPS)
> +		return 0;
> +	psmouse_warn(psmouse, "It is not alps trackpoint.\n");
> +	return -ENODEV;
> +}
> +
>   static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)  {
>   	const struct alps_protocol_info *protocol; @@ -2912,6 +2928,11 @@ static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
>   			protocol = &alps_v3_protocol_data;
>   		} else if (e7[0] == 0x73 && e7[1] == 0x03 &&
>   			   (e7[2] == 0x14 || e7[2] == 0x28)) {
> +				if (alps_check_is_trackpoint(psmouse) == 0) {
> +					psmouse_warn(psmouse,
> +					"It is alps trackpoint, use the standard mouse driver.\n");
> +					return -EINVAL;
> +				}
>   			protocol = &alps_v8_protocol_data;
>   		} else if (e7[0] == 0x73 && e7[1] == 0x03 && e7[2] == 0xc8) {
>   			protocol = &alps_v9_protocol_data;
> --
> 2.20.1
>
