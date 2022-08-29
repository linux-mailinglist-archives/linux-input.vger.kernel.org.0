Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 539995A46DA
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 12:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiH2KLs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Aug 2022 06:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiH2KLW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Aug 2022 06:11:22 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A28E4F671
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 03:11:18 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id nc14so9787201ejc.4
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 03:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:to:from:date
         :from:to:cc;
        bh=jhbD/qk5ewURE0KQaInMWutmbkxtojw+LzzejKYKeP4=;
        b=YYmDZtxp2FG0PX4poiX5lNi+6BGEojSBKFPoYXWhYH4xVKN5+/5X49vdQ8Qugom3fT
         rWWj59W4psJWVYRmwBcJWTigycNvJXQy/fFbrGLwX9qiKsaWEax+5WkxdhyrB7U2bH8u
         AToMG97h6jpHlB+cRU/QtPyH5xk1HaEgs7BiZws5LwNgoBhqwaQ7kztAJKsS644nP05i
         fSs4NUXdGLX6Po5Toerq4rIJ6CzcxBM95ipvcyVGIpe/H9AnQPcR6XS/j3o0H1+qKZ7g
         fXjo2y7goA2Qk6D1Gl9pa/xAaSpoaGAmHa35ykYhw1OZtHpiPfjf+oBNbdQ7PlkYy4Qv
         pUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=jhbD/qk5ewURE0KQaInMWutmbkxtojw+LzzejKYKeP4=;
        b=xzqCNpU9t599BpBoMcchtybRt5iKgtetiksyWvlzsF/wkYqMpMLG7HrcbnH9y+KSrH
         5eEY8c+khPDESBTRZQNokooKZH7PnCdqXvtx7l9fqFEZ/y3k/wzN895AzArbrYour83j
         a1mtGiTi3YvO/jn2YHhOkFeJzu0Z5/FLh4cpMSur0J2/41JcH5RozgLa0MHv2MVX5YI/
         WZCXztpX7QsfzXlP8ZYbl9brn5+fjp0gc0d3nKhKqm9pAzN7hyu5g0yr97h6H0ULRm+K
         I7tXqPS7RNRCKNvKhsIuzXBYGiYIrDiDTBGedMhw/mzurLTHPD2tShjiPxo/p4Z6Pq8c
         h65w==
X-Gm-Message-State: ACgBeo2Yc6G7F5N2Gv0abxZRZ3vi6ZqiuQsTux/G1SLzJintTECc7DK/
        QiWW/CLa6XEefA2GAvtaoxxX2Dx3O74hDPyq
X-Google-Smtp-Source: AA6agR4TcjIuWwRp4BVUd/u0QpfSunTbGi19jS2jOASay/NRsng1zqrfph4APEOr98kDwhEboG5+4w==
X-Received: by 2002:a17:907:3188:b0:741:4bf7:ec1a with SMTP id xe8-20020a170907318800b007414bf7ec1amr6536696ejb.448.1661767877073;
        Mon, 29 Aug 2022 03:11:17 -0700 (PDT)
Received: from 178-164-143-12.pool.digikabel.hu (178-164-143-12.pool.digikabel.hu. [178.164.143.12])
        by smtp.gmail.com with ESMTPSA id lw5-20020a170906bcc500b00730a1c73288sm4271190ejb.49.2022.08.29.03.11.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Aug 2022 03:11:16 -0700 (PDT)
Date:   Mon, 29 Aug 2022 12:11:16 +0200 (CEST)
From:   Greg Tulli <greg.iforce@gmail.com>
To:     linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2] Input: iforce - add support for Boeder Force Feedback
 Wheel
In-Reply-To: <CAKEH-67dv9PC41v7wZXJEopEnMQjwbPvQz01sFbndinpZvbrGQ@mail.gmail.com>
Message-ID: <3256420-c8ac-31b-8499-3c488a9880fd@gmail.com>
References: <CAKEH-67dv9PC41v7wZXJEopEnMQjwbPvQz01sFbndinpZvbrGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a new iforce_device entry to support the Boeder Force Feedback Wheel device.

Signed-off-by: Greg Tulli <greg.iforce@gmail.com>
---

diff --git a/Documentation/input/joydev/joystick.rst b/Documentation/input/joydev/joystick.rst
index f615906a0821..6d721396717a 100644
--- a/Documentation/input/joydev/joystick.rst
+++ b/Documentation/input/joydev/joystick.rst
@@ -517,6 +517,7 @@ All I-Force devices are supported by the iforce module. This includes:
 * AVB Mag Turbo Force
 * AVB Top Shot Pegasus
 * AVB Top Shot Force Feedback Racing Wheel
+* Boeder Force Feedback Wheel
 * Logitech WingMan Force
 * Logitech WingMan Force Wheel
 * Guillemot Race Leader Force Feedback
diff --git a/drivers/input/joystick/iforce/iforce-main.c b/drivers/input/joystick/iforce/iforce-main.c
index b2a68bc9f0b4..b86de1312512 100644
--- a/drivers/input/joystick/iforce/iforce-main.c
+++ b/drivers/input/joystick/iforce/iforce-main.c
@@ -50,6 +50,7 @@ static struct iforce_device iforce_device[] = {
 	{ 0x046d, 0xc291, "Logitech WingMan Formula Force",		btn_wheel, abs_wheel, ff_iforce },
 	{ 0x05ef, 0x020a, "AVB Top Shot Pegasus",			btn_joystick_avb, abs_avb_pegasus, ff_iforce },
 	{ 0x05ef, 0x8884, "AVB Mag Turbo Force",			btn_wheel, abs_wheel, ff_iforce },
+	{ 0x05ef, 0x8886, "Boeder Force Feedback Wheel",		btn_wheel, abs_wheel, ff_iforce },
 	{ 0x05ef, 0x8888, "AVB Top Shot Force Feedback Racing Wheel",	btn_wheel, abs_wheel, ff_iforce }, //?
 	{ 0x061c, 0xc0a4, "ACT LABS Force RS",                          btn_wheel, abs_wheel, ff_iforce }, //?
 	{ 0x061c, 0xc084, "ACT LABS Force RS",				btn_wheel, abs_wheel, ff_iforce },
