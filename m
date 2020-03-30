Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3AE019879E
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 00:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbgC3Wx3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Mar 2020 18:53:29 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:52673 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728876AbgC3Wx3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Mar 2020 18:53:29 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0F7635803DB;
        Mon, 30 Mar 2020 18:53:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Mon, 30 Mar 2020 18:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=HGd294u5H5KRbHXSdx/5SoSLy5j
        ZH78irSdihADxUxY=; b=cqx9Hxbs0iHJkNpHFbp53kVBHrAjNMkCNcCzSbFVQqi
        dVgVBMTlolA4Bhs2+X6nXTk/GxRNraNaIf6y3HKji/tikdbvcxVjDm6BcyGzDzFK
        7e2v+VzbjU+ovJh2G93wh+KYz7aa6pbYEKzTXFFI9adjbMPW7V4TaYl7VRhQyZrr
        ZBPRC4OgDKABOtua6PamFJP6FyoFCkjefxE8rb5dOSvzje5DbpwjWbuNhlz6zRCC
        Cv5qURhpaHvM3GcdqDEstRFslUDL05Y42+3YCuRCgf9lgnoIDr+xptCkUtSY3Kby
        662NCSy4H8LVpeSkwsCPwqWfo2xEpQm124voJf4r+fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HGd294
        u5H5KRbHXSdx/5SoSLy5jZH78irSdihADxUxY=; b=QpTaz5p2XPetDa0qFpFkmu
        glNuBWqoduY5rAUtV10DQt96mPfEdieL081JquZKDh3HOedNvZ5at+AppZgQNusW
        JFsVTt0YNuM7Jt3PhFJZKU/apPU8nJAekofbEGtxlopAIi8/y4pxVvEq0pbkEAYb
        SwL1mn09I1H1YZDWLtStzGMgD6n04KkmWFIZjw1MDuKRWOQtLimNasMrrEKZgZCk
        gO6afIGsQxVmqKi5zrJ2OuEovJmIygEqUme7VzI0s7WrSh6XcnxemzIddWAzp8kE
        KMnN7gwyXc5EBPSATzuoWkSLqX4akNSkbPW+JCFyhRff3xH0XSJ+8s9NfLAGJtCg
        ==
X-ME-Sender: <xms:ZXiCXqoLFO3HArQfKINUrUBawku7OmhNwOAKqKdmAgWHiT1RDmoNhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeiiedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecukfhppeduudejrddvtddrjedurddutdelnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqd
    htrdhnvght
X-ME-Proxy: <xmx:ZniCXgGrjdJbzc7E0nxHT7RHYr7GSw7ATVjggNGcDurrOQtdaVZX3g>
    <xmx:ZniCXsm9XqUuqBkAot77GsP-TgW8T83ypS-o5iiNg3JtJ4AhMDaCbg>
    <xmx:ZniCXjno77OSlbzFIPWdLrxmLmoHXZpjdtF-TJRGmEF7rf_BO8LdsQ>
    <xmx:aHiCXigPqvzjrlT2y4ulKJg-1FfBZmfLsTJG1kXUuFgHSnpx8Iq22A>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5EDE0306CA79;
        Mon, 30 Mar 2020 18:53:22 -0400 (EDT)
Date:   Tue, 31 Mar 2020 08:53:17 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Rob Schonberger <robsc@google.com>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH v2] Input: elants_i2c - support palm detection
Message-ID: <20200330225317.GB169282@jelly>
References: <1585551756-29066-1-git-send-email-johnny.chuang.emc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585551756-29066-1-git-send-email-johnny.chuang.emc@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 30, 2020 at 03:02:36PM +0800, Johnny Chuang wrote:
> From: Johnny Chuang <johnny.chuang@emc.com.tw>
> 
> Elan define finger/palm detection on the least significant bit of byte 33.
> The default value is 1 for all firmwares, which report as MT_TOOL_FINGER.
> If firmware support palm detection, the bit will change to 0 and
> report as MT_TOOL_PALM when firmware detecting palm.
> 
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>

Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>

Cheers,
   Peter
   
> ---
> Changes in v2:
> 	- Modify MT_TOOL_MAX to MT_TOOL_PALM
> 
>  drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 14c577c..93211fe 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -73,6 +73,7 @@
>  #define FW_POS_STATE		1
>  #define FW_POS_TOTAL		2
>  #define FW_POS_XY		3
> +#define FW_POS_TOOL_TYPE	33
>  #define FW_POS_CHECKSUM		34
>  #define FW_POS_WIDTH		35
>  #define FW_POS_PRESSURE		45
> @@ -842,6 +843,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
>  {
>  	struct input_dev *input = ts->input;
>  	unsigned int n_fingers;
> +	unsigned int tool_type;
>  	u16 finger_state;
>  	int i;
>  
> @@ -852,6 +854,12 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
>  	dev_dbg(&ts->client->dev,
>  		"n_fingers: %u, state: %04x\n",  n_fingers, finger_state);
>  
> +	/* Note: all fingers have the same tool type */
> +	if (buf[FW_POS_TOOL_TYPE] & 0x01)
> +		tool_type = MT_TOOL_FINGER;
> +	else
> +		tool_type = MT_TOOL_PALM;
> +
>  	for (i = 0; i < MAX_CONTACT_NUM && n_fingers; i++) {
>  		if (finger_state & 1) {
>  			unsigned int x, y, p, w;
> @@ -867,7 +875,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
>  				i, x, y, p, w);
>  
>  			input_mt_slot(input, i);
> -			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
> +			input_mt_report_slot_state(input, tool_type, true);
>  			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
>  			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
>  			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
> @@ -1307,6 +1315,7 @@ static int elants_i2c_probe(struct i2c_client *client,
>  	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->y_max, 0, 0);
>  	input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>  	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> +	input_set_abs_params(ts->input, ABS_MT_TOOL_TYPE, 0, MT_TOOL_PALM, 0, 0);
>  	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
>  	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
>  	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
> -- 
> 2.7.4
> 
