Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8D5370EAEB
	for <lists+linux-input@lfdr.de>; Wed, 24 May 2023 03:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239038AbjEXBnp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 May 2023 21:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbjEXBno (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 May 2023 21:43:44 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB99130
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 18:43:44 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-55239f43426so279594eaf.1
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 18:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684892623; x=1687484623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vIsHGl9ozYTs5rseV1pZIPnBfkYTn/eydd61k1gZ4kY=;
        b=pLwp87/vqopONOkkrzPU6qQ6zJ8KPVxPyg22hCWjpBqwGzn22X6q3lTDlYMpbn796x
         K/0aGIgCoM7ETnMVA64Io0b0SfUtaKPa3x/oj6CurCkeu7uMN//wXIQKaGE6gd549Eia
         7P/aoPeEEA/3BFWUgRrLLw8jlebmlePBaPkrGRsFK2oW62mss1nkdsEe8cWXHWZ5GJtj
         FO3Xl0mxt49+OUDCT01bjmrnXYrunDimnCi7N0cyRUiBdHOF0Na2Y3ViFp6OCsEW6Q72
         CNf/A/FFmnmyWHWEZzfnS8Jtgw600DBxXSAO8ddEe+VGLFlJUan5VYu863QxsgR1cIxa
         xn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684892623; x=1687484623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIsHGl9ozYTs5rseV1pZIPnBfkYTn/eydd61k1gZ4kY=;
        b=Sy8DvZImFIVNBakY5zrdLPvE4nsXAmX9k7YR5vJsgpPiPbNQZ/XU85adi+dMmXu48s
         FzMHCckE4yR/D2N6ODCJMCyTcF16Sqzcxbf9rpPKdgVuZGsDStsLYa+wD2tR0EXTELTc
         9v+IJz/FnpLLSImBy+H2auBs18t1HbnxG8zOrTrnA9l2RKq+PQI01r19q2iJl9dzGYKT
         llPQ73BQa7xlClsFw0775p9i1uu1Ln6pugFLu2rvuBnT+UpQ7+08Yzgb+Lnsw6tVCk2Y
         7W6O0q9aFVp6yQJpyh/UOHcgYIcf1rgbik6d0+CrlR7QNZPuUPmlBAHh2R+CJPw/6Ojz
         GQUQ==
X-Gm-Message-State: AC+VfDyX0WBgw4sCIR/fW7VCUL3M0xd+amiGexCbGeHg9DaQZ2bpN/rV
        ysmuJy+jpA6NatDumOSDrfvbiT9lxA9VnATGhWwspj4VYo7eg1eKFSE=
X-Google-Smtp-Source: ACHHUZ7IlZhQvUKEN4pSCLn3RkFv1vgGnysjyfWgfayTnvcDIaBFXW/3I3uvS76281hYfdhoty5Ed1SCQGde8f+80Lk=
X-Received: by 2002:aca:1a17:0:b0:395:fae4:7da4 with SMTP id
 a23-20020aca1a17000000b00395fae47da4mr7596498oia.5.1684892623386; Tue, 23 May
 2023 18:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230425163844.3711710-1-svv@google.com>
In-Reply-To: <20230425163844.3711710-1-svv@google.com>
From:   Siarhei Vishniakou <svv@google.com>
Date:   Tue, 23 May 2023 18:43:32 -0700
Message-ID: <CAKF84v1oq6F5KK029rfZJyPa6ZetJKAA_Fvsh7Z=DyfLAUNqFg@mail.gmail.com>
Subject: Re: [PATCH v4] Add rumble support to latest xbox controllers
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Friendly ping on this CL, thanks!
