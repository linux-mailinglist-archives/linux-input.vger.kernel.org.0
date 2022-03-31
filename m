Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF00A4EDAC6
	for <lists+linux-input@lfdr.de>; Thu, 31 Mar 2022 15:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbiCaNrA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 31 Mar 2022 09:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbiCaNq7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 31 Mar 2022 09:46:59 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CC44E3A2
        for <linux-input@vger.kernel.org>; Thu, 31 Mar 2022 06:45:12 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id g20so28220709edw.6
        for <linux-input@vger.kernel.org>; Thu, 31 Mar 2022 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=1XVqi4Ib1eRyRv1oXeeUNUCcAwlXPZRFfU2ywy6AHVM=;
        b=DvWtICW4wcw0p+ZdyUxG8LjxUlAwDA/CpozAsu3ATDx3fqjI3iAIvBJYHybBNUCBqt
         X31Jf4yE2K/TSU1hmU0jzuqgG+GgEqt78EhCDIBgCRZvO2t0qC3FY38uUOCyfgLIR0nN
         4g6h7N4LYLUVFjKUrEmY29OhbD00sTKNLaRW7/oR3c/88/sn1CTt3HAh4/0X3kVp88+V
         Lo2AvEmuQ2Ya730V2k21rjzo7OicyRy2qaQuxqd6GbAUBw6wTsmkiPxE3RjEEsy2gdBg
         p39B6rgZT9QAYA/hW0SGiEFu4QApvj9vwOvjLdfxuMA6aE0Qy8rV07Qt/llMEaXVMhvU
         XBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1XVqi4Ib1eRyRv1oXeeUNUCcAwlXPZRFfU2ywy6AHVM=;
        b=j11OEFfLlJ+/1ZWZGUmgC+zjmYSeXCltr93n2M5Y9NC1OnOsw1jSkI9AYapXQG5cWM
         FCNYn3jrpWPFToRkEH1Clwiw+AObwkFjdCZ+aBvRGV142y751aG6EKKzCcWewdM4x3kT
         NL0yGgQ/uXRzF2ztFa/o8o2xR6ZD0qmlK0/UgE2L4XCLfwG9Fn5m5F3kiXTkhVthTNyi
         SiDTY2jmkE7yzeY+UAIC5YU1ISpPGJhgAl3fr/5O/Hgp40eupA4pRo1EfZjPKkeYwa9n
         2mjU1hZ2vKwYcchNaSYVrmeDILuMuCkdDIfrDWacIbxKGFD+1CYbVjWEKrqKEfl9d+FD
         Kyuw==
X-Gm-Message-State: AOAM533bekN94b6MezuvdEvOdw5zkzfeAKQF3UDW8hxjWNqAC5H467st
        T7noyCD2mxp8bz2a4XceFGcY70sHZWD97kspqDI=
X-Google-Smtp-Source: ABdhPJx85gS/Hgjqg7yHYesphep2AYXywUvvLA5JCnps72rKUtUId0OSbwsaJd4P5Dv/SRL7ZmITsANfZkOkGzoG7IM=
X-Received: by 2002:aa7:cf08:0:b0:418:e5f7:b2a1 with SMTP id
 a8-20020aa7cf08000000b00418e5f7b2a1mr16282981edy.76.1648734310740; Thu, 31
 Mar 2022 06:45:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:1b59:0:0:0:0 with HTTP; Thu, 31 Mar 2022 06:45:10
 -0700 (PDT)
From:   Eleanor Taylor <bkane2624@gmail.com>
Date:   Thu, 31 Mar 2022 06:45:10 -0700
Message-ID: <CAH67L1TM0UTVg8Y=XcfiON2H4rVOu-CvKxNnRmqV0r7tXOjZmg@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello,

I would like to talk to you

Eleanor
