Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4295A4048
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 02:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiH2ANu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Aug 2022 20:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiH2ANs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Aug 2022 20:13:48 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9F32F02B
        for <linux-input@vger.kernel.org>; Sun, 28 Aug 2022 17:13:46 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id k18so161461lji.13
        for <linux-input@vger.kernel.org>; Sun, 28 Aug 2022 17:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=9m13/PjpKnPYANbDzpbJ472s7pLSd/ro7G9b8ckEB04=;
        b=a0DnRZZgjacWcLN/U5Rryim82rSahpswmE2zwkoheP/vOI8S4L2g6MV6tsmEg6qrd+
         +mvT0VVrAndvkxWpJI1kwD9zFJybQaFctD0xc5975qf5uYKqDEjual9+9o45YXqPTHnm
         A9wBOzBakoRmUcON8PaU9Zh3A0p9f2c/m2CsyJI4JvGTTWSB+zcRCOy98syqqPsWvwsl
         RBbrvh7JIRNVciizre3O/3ss7C724jiVOVeR3q8Nbg5ORfhpe0E+21oZ/H2Q5ncj0ZW2
         Y1S+E5FH+jfUWx4QGsf6WjAwNvXYRJKkrNZ28g8sjaRd+0NEXympjxyiE2ryK2/4tYxc
         WTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=9m13/PjpKnPYANbDzpbJ472s7pLSd/ro7G9b8ckEB04=;
        b=L9/z/q5DtFSTAW0XnM3w3rLxXeODSby5tpN5rkh7p5EdYSs6/pPOdMQ8WIJtWGKfO3
         eJPlImanay2Gv8z1SRz9W7BQpmY9KYmqsuV3bd+f6CIdvN6qc9i9HmycSz/sNIY8Ijsl
         +WtEhECz2kQ4FTw7PB9HvLlRFJcB6L//eNXiRkePUXcnzoja2g/v1+Y6keE9QM8110ZJ
         gZR0sga15UcWRyKHhdog5EmzBLxGjTA1PN/4925KfmKRlg/pdQxnOMp7cWR6WuwIV9z3
         4PAlSVwI45yic20iztBxvrKqV0dNcKs2vBj4Y3kPUsHymOfcP+wcILLccIHUDBYJsbyS
         wpMg==
X-Gm-Message-State: ACgBeo3Trbn08SH4Q6WI7FBWyfhKZZFhf2Nn/lpU5KXN2D5dfAUXzkDE
        OuAc3wVDt5odLEYwebMnP0Bsuj/InPyVyRdYvGLVit1q
X-Google-Smtp-Source: AA6agR7ePPbVCQa9Qglnzg03pNjUHv2q0Py0Vf75sJGV6Owc6ym1mjwQjcukbLO7eVGDNHVM2l/QvFggGr2vAYtMzI8=
X-Received: by 2002:a2e:9295:0:b0:265:92d2:a684 with SMTP id
 d21-20020a2e9295000000b0026592d2a684mr418335ljh.186.1661732024717; Sun, 28
 Aug 2022 17:13:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:a594:0:0:0:0:0 with HTTP; Sun, 28 Aug 2022 17:13:44
 -0700 (PDT)
From:   Greg Tulli <greg.iforce@gmail.com>
Date:   Mon, 29 Aug 2022 02:13:44 +0200
Message-ID: <CAKEH-67dv9PC41v7wZXJEopEnMQjwbPvQz01sFbndinpZvbrGQ@mail.gmail.com>
Subject: [PATCH] Input: iforce - add support for Boeder Force Feedback Wheel
To:     linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

diff --git a/drivers/input/joystick/iforce/iforce-main.c
b/drivers/input/joystick/iforce/iforce-main.c
index b2a68bc9f0b4..7c6d58afa2f1 100644
--- a/drivers/input/joystick/iforce/iforce-main.c
+++ b/drivers/input/joystick/iforce/iforce-main.c
@@ -50,6 +50,7 @@ static struct iforce_device iforce_device[] = {
        { 0x046d, 0xc291, "Logitech WingMan Formula Force",
 btn_wheel, abs_wheel, ff_iforce },
        { 0x05ef, 0x020a, "AVB Top Shot Pegasus",
 btn_joystick_avb, abs_avb_pegasus, ff_iforce },
        { 0x05ef, 0x8884, "AVB Mag Turbo Force",
 btn_wheel, abs_wheel, ff_iforce },
+       { 0x05ef, 0x8886, "Boeder Force Feedback Wheel",
 btn_wheel, abs_wheel, ff_iforce },
        { 0x05ef, 0x8888, "AVB Top Shot Force Feedback Racing Wheel",
 btn_wheel, abs_wheel, ff_iforce }, //?
        { 0x061c, 0xc0a4, "ACT LABS Force RS",
 btn_wheel, abs_wheel, ff_iforce }, //?
        { 0x061c, 0xc084, "ACT LABS Force RS",
 btn_wheel, abs_wheel, ff_iforce },
