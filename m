Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51EC7639BC6
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 17:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiK0Qf1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 11:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiK0Qf0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 11:35:26 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9ABB60FF
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 08:35:25 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id z92so2075754ede.1
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 08:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+fJQhFzRnXsk67H2zRbV9y9HsjlNSmn0w/VxDtZpo8=;
        b=dTqgLPehIV3rUgdwnGWK1qqTi8P5VfT4UiUR2SASu2h6vm3Cwg4C2wHvJbfNRKuPJE
         Swcu0tSLAzO7KSXBNU8nY32tFfpDOEbNcVNs2jxA2oFcj+yoc+bfBnl9M3bQElO0pOjM
         T0v96ORYDpwvJqi0sdOJ6AgOEO17zzC/SbgfRSPedu11qIBMouMKSXly/QHebSvAZlps
         CDljLf28kFZT3QzyJHUwmc+7KhofsLGHuoQeIEddUoDGQ5VLfWb3/zuBClD54305nW3j
         XUfSYkol0sD/QzC+oO4h+XX6G0YO3MsqjRRgWtl9uB26kE6cKkPZPo4P4qpYzh9rUHtR
         divQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+fJQhFzRnXsk67H2zRbV9y9HsjlNSmn0w/VxDtZpo8=;
        b=4eknqc+7yUNFJ7nqcpBsKJ3M6lhsahgvymqE/UZyPEZh3TwIJoUJjBWuqUpHsiUVEC
         3OlWLcM9dLMkYwvbFjCjQX2iXillec2PVcLbZ4V6hzmkUjhPnAPIBSKXPDELAIYhTErc
         T9Bc4T3MP4BSWPyQyDzDUwk0HdR7xYOeFdcLoZBxQ6YdcKD/nyBVIc2Y89qwZg9NfOQJ
         byd29eCWpVeeyKJV5TYlspiHje2S3xYHcizY2bZ/z1EryTGOMHpzu+sGF9TrJd/Xfhdc
         3P60ejv7fZ0XvJFblhdVvsbWhC7SEZVhcJwemO0FGnl3A8QOo/wrC3FCbxBaW6KupgDh
         ZaXw==
X-Gm-Message-State: ANoB5plGjggDxhsQa69mRM4B3k/qVqjyuGFZuG26G54KCNYhUKFUMcPr
        sKa9vRk+bQ0XFra2m4M4/Vd6JEPXVPBHDqDU6C4=
X-Google-Smtp-Source: AA0mqf4JBO3H30PIwllLkJoFyjoogvLQwpkgIFRhMNLL2y2ysrg+qnPhTtPYDHjYt5vf8A9otjDu+TUjPyjABsgBRFM=
X-Received: by 2002:a05:6402:25c6:b0:461:b825:d7cb with SMTP id
 x6-20020a05640225c600b00461b825d7cbmr21010239edb.167.1669566924302; Sun, 27
 Nov 2022 08:35:24 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:905:b0:24:877f:7460 with HTTP; Sun, 27 Nov 2022
 08:35:22 -0800 (PST)
Reply-To: thajxoa@gmail.com
From:   Thaj Xoa <rw36223@gmail.com>
Date:   Sun, 27 Nov 2022 16:35:22 +0000
Message-ID: <CABnv2bsVX2K_mBqQLGNKGMm0pQWkFiJ-2wskydno7S2atKvBjQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Dear Friend,

I have an important message for you.

Sincerely,

Mr thaj xoa
