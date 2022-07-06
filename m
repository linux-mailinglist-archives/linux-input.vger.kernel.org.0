Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31DAF568E17
	for <lists+linux-input@lfdr.de>; Wed,  6 Jul 2022 17:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbiGFPtY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jul 2022 11:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233824AbiGFPtE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jul 2022 11:49:04 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749912A704
        for <linux-input@vger.kernel.org>; Wed,  6 Jul 2022 08:42:26 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-f2a4c51c45so21870007fac.9
        for <linux-input@vger.kernel.org>; Wed, 06 Jul 2022 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=XQECPGbI7yYCA2ax5HRRu40BEupY02apRIdo/EARm0Mf+DmosQ7gl8wfAU5p484Bx8
         CCKTfawcDZdxkReE6Lq3Dr9wfNj94Q6V07LyjATFq9oibnG5ZSpQzF4rse+kQxEwI/12
         ZFsYJho0IotRk9TQ5Tq6dlML92hAW11MbhSYszs3wUYIsFIuWlZK15i7Y5Oq7ZBFwQOE
         KFFj5eMqL93uXDSpJgBlK0DlY9qYBOnbXtDM+VkOgvWDgidEPCAFdPtq90CksT0v5tyT
         z289V3ct0tYraR7VPRZg+Pl161tWLxRrst/VR6XHSqjkrqv1AwUQoBkuRU5zWSW/updI
         ZRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=6ZpU0r2vAFuFrajgJlLKiU0tpxAGnSa1xfHGbygrjt1VsRBYYQQIUJPzm6oO5pFTz4
         ASK5cLe4ZjCwaoVJccpwSmRrK0qbuHOHuu7FSxE7t2Hlt3VIy8iTPobir0XFnt9DsLWS
         KZA1BlUuhS+lwcJKIAgmg0NP78jck2lybqyhaZETRfSlFxcC5LxjPwBqHCkNWNsXTlzc
         NRaJMuk6JLgls56QLLs8JuZjBxHd1zPH7nPXFZRsNKVgwYW51P2nkfi+40iafjQgFign
         tP1ocGdp/bxX62lpdv9rWsrq7B1r60GrIwut/ZiFyrqCNEyGgZM/og83tsfMp+aOdUjV
         ffIA==
X-Gm-Message-State: AJIora8v80aFKIoWqOczrLQVS3wCU4gcG6V/c/rHpZTfITDmNzUZIB/B
        4+bc1gQ8LoI69mpkOBIW46iUUeGC+/Ft480b7v0=
X-Google-Smtp-Source: AGRyM1uWuqPnoZU+hQ39RA3y/RcWyfHl4/nTCo2cWsFxGQrQ99tK3xVdwQ4HyNHyc/CvLt7K9Hg+3al5mtc5p/FE53M=
X-Received: by 2002:a05:6870:7022:b0:10b:f0ea:d441 with SMTP id
 u34-20020a056870702200b0010bf0ead441mr11953904oae.39.1657122145912; Wed, 06
 Jul 2022 08:42:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4545:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 08:42:25 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <avrielharry73@gmail.com>
Date:   Wed, 6 Jul 2022 15:42:25 +0000
Message-ID: <CAFSKFDYHgAVrTG-+f+S5PbO07toSu3kpMMLkpSgGre=yJehYsQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

LS0gDQrQl9C00YDQsNCy0L4g0LTRgNCw0LPQsA0K0JLQtSDQvNC+0LvQsNC8LCDQtNCw0LvQuCDR
mNCwINC00L7QsdC40LLRgtC1INC80L7RmNCw0YLQsCDQv9GA0LXRgtGF0L7QtNC90LAg0L/QvtGA
0LDQutCwLCDQstC4INCx0LvQsNCz0L7QtNCw0YDQsNC8Lg0K
