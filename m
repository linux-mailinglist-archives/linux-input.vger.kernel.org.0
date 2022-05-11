Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 059315236AF
	for <lists+linux-input@lfdr.de>; Wed, 11 May 2022 17:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242522AbiEKPG7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 May 2022 11:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232611AbiEKPG5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 May 2022 11:06:57 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BD045505
        for <linux-input@vger.kernel.org>; Wed, 11 May 2022 08:06:57 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id q18so2129803pln.12
        for <linux-input@vger.kernel.org>; Wed, 11 May 2022 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=zLAXOt0+g+Gz9bXUVZthS9o5V8JSghOXkCMObSfdPds=;
        b=beFeNUR+AKUPmFv9TXGrH6RwVBCZ3cvbUtryI2lyqN3mfxUnV5nzBi+Y7af+5C0tCM
         e6kf6doomI9sCmGPL54dpz9k09q9+Du5az3lfZokjRZbngdSIau4zxLX5auTmK/1bsNy
         aSM5xbTJOzRgp+TrbtsE511nglYAL1pVFGc74/HmjSaeUrxi78FqY0WbOQUQ8+SMwHwe
         uvDn2vI/vq8lwncP/hnrkKyjgt3eyyMmSAoxNT1LoBvcdU9NdpZYWPM30HCwuhlycl35
         v1cyX2Msi2usuBGvxGBuOTbTmNWY99Qia62ZxrjIGIAwQTJNsS83Lz5znBkJ3OPt36+B
         YsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=zLAXOt0+g+Gz9bXUVZthS9o5V8JSghOXkCMObSfdPds=;
        b=0bwQrH3gj4KpIQZVCgauUWOKf1RAy+AgTiCab1QSY01YoZjOIf+FJngtN48U+l8XzV
         oAWaIIkXGeko/8Ewq3Ih2TXysIW7X1wW1zIHJe5N1iJEOdBK7wEhx6WOpPB9IG3GVhW5
         hWLCfgWYZWjF151t8nsEUD5MLyXT2yw6k1NAJ+cNtXrdPdZRrbB/41AFi1vTuHXoYZPc
         fvTbwAHiJM1lbHhQ8pii3STFbdtC261Da4qxOTRawWXVAxDKU+sbD8i7uSaCfydfbSru
         FmGpf/8SkHCr2ZLhM5HnaoAkEt1D5vA7ADnC7IwlxGTvsiJHqg4hiSnbc/kMlVOGYGN6
         jrdw==
X-Gm-Message-State: AOAM531dhxZ+5kDGjTtdd4Qse5OFyCH3iK0S1pZhSdKZLzxW3Px1Bnj0
        kdt/PTFT0otpSwBxdHP1hTwf2nHEupZCQ845GDc=
X-Google-Smtp-Source: ABdhPJyUPvYKxsFEA/7qCeLOZP3XNPyvs2quFLQHYk0N4C1Td9+EBBzBm1W0jF3ecwwm5lOf/aCPLBnumPB+2tJtEDc=
X-Received: by 2002:a17:902:ec88:b0:15e:c17d:b092 with SMTP id
 x8-20020a170902ec8800b0015ec17db092mr26001101plg.88.1652281616242; Wed, 11
 May 2022 08:06:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joycem001m@gmail.com
Received: by 2002:a05:6a10:1008:0:0:0:0 with HTTP; Wed, 11 May 2022 08:06:55
 -0700 (PDT)
From:   Ahil Lia <mrsliaahil070@gmail.com>
Date:   Wed, 11 May 2022 15:06:55 +0000
X-Google-Sender-Auth: 262EHWgVJMV_ptq4XrKD1FQXNro
Message-ID: <CAN+-AFNRRAeHwEB9UZxnDi8yY0kZfKANwoKkhpKfWA+DJVLPsg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello, I need your assistance in this very matter
