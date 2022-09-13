Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3485B7A0C
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 20:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbiIMSuV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 14:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbiIMSt5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 14:49:57 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69EA6BE33
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 11:30:13 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id d12-20020a05600c34cc00b003a83d20812fso10092215wmq.1
        for <linux-input@vger.kernel.org>; Tue, 13 Sep 2022 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=VvltLAVpxKsiedDpgC4G2lgjm3r1Z9upYCvVxQKBmgSDO05FA1dJq9nGnSzSyP7Er1
         1V3QK2cKIThFzmAWbXHkf8IJGTE8p7RwQOtbISx0rGjJvWUDRJBp2fwaYFpqwhHt4Yt8
         NgsiCGf8W13SuKy6c8B8BQuH/4p79AQ8LZ3c//ZMFCP0SquMHq8tCz5cr4EYYADzi/ld
         aSs0Lzlx/RYK9uRiqOMc6s801qqyHmfeypMOb+8XXbFWvsx3Tkahoi7q7Oy94i6hIVxS
         FH1Ymw63pA/eenuOg/GQD5HXJN7gf34dpYkMMuDghzGE6+ZUt36bPaywRGGgKQCm1Tt2
         FDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=jCFlsa2tMTUE64gNB/w1fy3L7IZ/3Mwevm/TY/cowz+TTVZ3PzPrM5AzlXbEuwNnBR
         XRo80gfKi9bFpM+E+1d7DxuCl9OCDj6LVY6hcvMnvJNLFdm3Y9+ol59OIlQl/vnhuhXX
         5rFBGI560qjg5JxzkrDEk6+++pIh9zX7txyD2raqwEpKsFibrEQNitm2gx6qJuPCwqY7
         zT5brc8j8czgrw5oKyHDlDyW+rbMz0zvKv84MytG6yTfHttSQFWDvRSl9tSaZsAdr2Bp
         QrR43hLdzHp2G/dmNnQiVdkTgAqIbVsRrEXOZjiWR88kCLYiePDtnIEf4XXt3rJDLF/c
         L94w==
X-Gm-Message-State: ACgBeo0uwrvY+ARdfB0GuSKehkXlu/8qnKpVGdhJ1NzfLIKCCIVITKDD
        Ig9lLaG9SDUkXPqoo9PnmULFvVSsi1WStseokqFA/fEP
X-Google-Smtp-Source: AA6agR76lPQmWWsUX26thB1rsr6Y9uwFVI8NWanhJPILMP3qnD9cpTNtISVDeKyRRakmAyQfFWjpn4v5cnLEY3Cc2Uw=
X-Received: by 2002:a05:600c:4e91:b0:3b4:9b0a:b4e2 with SMTP id
 f17-20020a05600c4e9100b003b49b0ab4e2mr470698wmq.170.1663093795193; Tue, 13
 Sep 2022 11:29:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:f94f:0:0:0:0:0 with HTTP; Tue, 13 Sep 2022 11:29:54
 -0700 (PDT)
Reply-To: maryalbertt00045@gmail.com
From:   Mary Albert <ltchadao@gmail.com>
Date:   Tue, 13 Sep 2022 19:29:54 +0100
Message-ID: <CAKVcA9sCUKj9pFHxfPER28wVteQTLh92zyL0nBy13W+vA+=nbw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello,
how are you?
