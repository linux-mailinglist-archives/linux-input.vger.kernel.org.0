Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B4B66D501
	for <lists+linux-input@lfdr.de>; Tue, 17 Jan 2023 04:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbjAQDfG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Jan 2023 22:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234768AbjAQDfF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Jan 2023 22:35:05 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772AD22A18
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 19:35:05 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id q141so11588100vkb.13
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 19:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t8wuAyD0Fh3JBW2+NhyKdH3QM3J6MJRZlXywkChOzpM=;
        b=mMPmdG9e+IdagOv6krFzHjBElUHwsr2/P+KVdqpgxc59c9y1nY4d/kq2yTXAbMOLrO
         gd3KPB2vX2fBl8jITJ+/huSEtAl81zhbfu/s4YqiVdm1TkcUewx+jWUtp5nCZ0EGPmqO
         ZQHrvr/fTFOhUZaJ2GhZ+CrcBccdk0tNc8XiWr8PQRwiKPjHfbgaUCK6V/UCWoyHfJjC
         y8DKMTvMIr0ZHiitGxS7YvrQcf8gHm0Ob4sBEWlKyF2XsjuBp3jdF1x1/w7cCQLsinD+
         aOQ9BejSPDVhSRZKpmFsByNOeHQZCSrJzIR+XWM0Il8ijNhcv9zGHqyijyk/TR0eO/9f
         KHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8wuAyD0Fh3JBW2+NhyKdH3QM3J6MJRZlXywkChOzpM=;
        b=V0KVGU2NTqPoWPVoSkeqdCJMe0XjF+39v5npsMWoCFFkqJU/UwQiJbxZ+BhBW88rWi
         3utUd+D3wHPIpQx05xkr/W2eZ05sU/mYgy784O0OLT95WIas6lXzTbcSJL5xiEdjjOOv
         agiRBlRaqaw7hX+WU1hqxAXKk09oHalUr0/nU2uhrlIZTTkg4T+bEqa+U4HoDwzmmMmb
         deXfu2RBGbO0otnNqKamJyhLOXhl/dsf3nX4OqictGzTHQ9nGYAX/OX26+x4M3XQnQTL
         Rk9laspkDVLCRdziJz9RAO1I7nGK8tty/oTJmwe97PJMduNx/rbwwHuVv/NvyHZ8DFFD
         dXIQ==
X-Gm-Message-State: AFqh2koBHjySK80x0LoHBCMB18jOcXY3deyAcN2dQ77lh53CK9lAxBM/
        Oq5ME9VvLs7vpaxerkYhV3rYAPa45miVg0kDo5E=
X-Google-Smtp-Source: AMrXdXuBrKGo9SaYuk5Fs/GtdpNFliF7wgT6ji0CQz6+PW3p1HJjmwmBgHQ7lj8T1bsnoduUUr9peHpiUNrip5ZKsNE=
X-Received: by 2002:a1f:b2ca:0:b0:3d5:3ee8:6603 with SMTP id
 b193-20020a1fb2ca000000b003d53ee86603mr190644vkf.7.1673926504595; Mon, 16 Jan
 2023 19:35:04 -0800 (PST)
MIME-Version: 1.0
Reply-To: kristalinageorgieva5503@gmail.com
Sender: sg997864423@gmail.com
Received: by 2002:ab0:7241:0:0:0:0:0 with HTTP; Mon, 16 Jan 2023 19:35:04
 -0800 (PST)
From:   Kristalina Georgieva <kristalinageorgieva5503@gmail.com>
Date:   Tue, 17 Jan 2023 03:35:04 +0000
X-Google-Sender-Auth: AZDNF5lc8lIASKi9teT0SfS3EWM
Message-ID: <CAH-3994Up+gi9w19-TKmc4UqgNb5rM7_nqkVVb5q4N94jvfkEQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

My name is Mrs. Kristalina Georgieva from Bulgaria.Did you get our notice ?
