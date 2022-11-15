Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C12A62991A
	for <lists+linux-input@lfdr.de>; Tue, 15 Nov 2022 13:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiKOMnx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Nov 2022 07:43:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiKOMnw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Nov 2022 07:43:52 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0BEA45C
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 04:43:51 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id h9so24085140wrt.0
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 04:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IBz7dwjfYVMtJ3/CIpYC6A2AYT6dA4JQsxab9KmouGs=;
        b=b4olTs9pL7nWMeaD0GRkLCr9lKhtyTqdDjO86OmptZ7gNXLWtRUsf39tP/5N3b5iDw
         7nOD8fsiBnIxjU+StIJPQD0NAdolsqJbYyieuntgrEHuANN1h+b6mVvMUurD4Qwohlen
         MUuYmTxApY4KsVoiHY2ArNypa2paQi6s5Jwa47kZdZLiK+ANwMws3dCFtpAR7nKLJI9d
         BwTT/Ojdv7p0v1iRDbLArHXvz0kFHmlDq9JSCttNk4fVJI3MEv/Jru3qc02L4n+N0Xpu
         gH66jEusw4JcANTUdNQnusTZnABxfoVhpbSq+10AkxjywqOehrP69yDIHI0tLtrCSk3w
         /enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBz7dwjfYVMtJ3/CIpYC6A2AYT6dA4JQsxab9KmouGs=;
        b=PPkFxklm/mxlswH/jX1uwJSrw3t8ZJWCcRAS0obXrbe1SGmB5IbStlr80hRV9O3L5I
         JR6P2mCqP0bnsS4Am9eSXcNYD7MWdQYuIRD16rmReiFuN58lOeuhzQ/H0y3cXMws9h7V
         W+U9BB35SceefWXZxAbe+IZglYUB/jqjByJBjr2e11cfLg2c++wry65X0XLTpmcFoqx7
         NaO18885lpu1K77RAiIS1lJgzNLT3AKjfwI6MUh7fmfz1P7hXlCTkkyMAg3tucxIf1DW
         lXkSvx5P86PIXmYtePxzorn49WhFrQDiIB/md8DIiQ9+ArcymmhwdF5Wz/YGgBHf1wBh
         asgQ==
X-Gm-Message-State: ANoB5pnwnodf0vHPbL4BHM7MZsK14OkhpcEXM3L84cCG6XPR58H1yW5N
        6DXF8bMLHS3z50xpMvejCpqSY/xywog=
X-Google-Smtp-Source: AA0mqf76zTcyr/VbcSA4OHMj1mh4dmary4VjQIyy7rLOVGkn2L5CKF9jdUmpo5MN9Bs1ahAP3XU5Xg==
X-Received: by 2002:adf:ec51:0:b0:236:76de:7280 with SMTP id w17-20020adfec51000000b0023676de7280mr11006179wrn.194.1668516229611;
        Tue, 15 Nov 2022 04:43:49 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o24-20020a5d58d8000000b00236695ff94fsm12197149wrf.34.2022.11.15.04.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:43:45 -0800 (PST)
Date:   Tue, 15 Nov 2022 15:43:39 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     macromorgan@hotmail.com
Cc:     linux-input@vger.kernel.org
Subject: [bug report] Input: add driver for Hynitron cstxxx touchscreens
Message-ID: <Y3OJe4lOkOsRMIcu@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[ I sent this a couple weeks back, but it turns out that mutt + msmtp
  has been silently eating my emails instead of sending them so I'm
  resending two weeks of email. -dan ]

Hello Chris Morgan,

The patch 66603243f528: "Input: add driver for Hynitron cstxxx
touchscreens" from Oct 28, 2022, leads to the following Smatch static
checker warning:

	drivers/input/touchscreen/hynitron_cstxxx.c:238 cst3xx_bootloader_enter()
	error: uninitialized symbol 'tmp'.

drivers/input/touchscreen/hynitron_cstxxx.c
    209 static int cst3xx_bootloader_enter(struct i2c_client *client)
    210 {
    211         int err;
    212         u8 retry;
    213         u32 tmp;
    214         unsigned char buf[3];
    215 
    216         for (retry = 0; retry < 5; retry++) {
    217                 hyn_reset_proc(client, (7 + retry));

I would have changed this to a while (retry--) { loop except the retry
value probably matters here.

    218                 /* set cmd to enter program mode */
    219                 put_unaligned_le24(CST3XX_BOOTLDR_PROG_CMD, buf);
    220                 err = cst3xx_i2c_write(client, buf, 3);
    221                 if (err)
    222                         continue;
    223 
    224                 usleep_range(2000, 2500);
    225 
    226                 /* check whether in program mode */
    227                 err = cst3xx_i2c_read_register(client,
    228                                                CST3XX_BOOTLDR_PROG_CHK_REG,
    229                                                buf, 1);
    230                 if (err)
    231                         continue;
    232 
    233                 tmp = get_unaligned(buf);
    234                 if (tmp == CST3XX_BOOTLDR_CHK_VAL)
    235                         break;
    236         }
    237 
--> 238         if (tmp != CST3XX_BOOTLDR_CHK_VAL) {

This is a genuine bug.  It should be checking if retry == 5 but maybe
with a define instead of a magic 5.

    239                 dev_err(&client->dev, "%s unable to enter bootloader mode\n",
    240                         __func__);
    241                 return -ENODEV;
    242         }
    243 
    244         hyn_reset_proc(client, 40);
    245 
    246         return 0;
    247 }

regards,
dan carpenter
