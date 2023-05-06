Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0206F93AE
	for <lists+linux-input@lfdr.de>; Sat,  6 May 2023 20:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjEFSqj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 May 2023 14:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjEFSqi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 May 2023 14:46:38 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2367C1437F
        for <linux-input@vger.kernel.org>; Sat,  6 May 2023 11:46:38 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-643557840e4so3378827b3a.2
        for <linux-input@vger.kernel.org>; Sat, 06 May 2023 11:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683398797; x=1685990797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mP8DQTqvxfWWLiEHhGrHtETiVRc+IvyNROuq5lZunDI=;
        b=aLZOHIJJ8VPZB22JFsVif9+LndLExb540bPJRY4e0D7HBF5yxv5pMCuyETCS396g2p
         iOtMFdURlwerhZSjyeZH5iSVlJaREI/RzAtGtSPVyXY+SqFYFrTKAlCa6/fAUd3lMzxQ
         nvctXkEZ9GIeNrg+RQA0lf0IA0ybXu2D2tsDDTXmKz9ahVJ6IVO+GaNdJkaingdJ9kks
         0o0VmHDLnv/kPTOUa0dWyOrT673WmcLklG/lGJhHEhBPp4J/BZ2VqJk7z93Fh86Lrd38
         ZBsawNDg6JqD0K32JVqWPu/FEi3hgWt1Rgu3lCYqOD6/ytC8MYmT5NawTC9MBZlrtGP5
         Osqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683398797; x=1685990797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mP8DQTqvxfWWLiEHhGrHtETiVRc+IvyNROuq5lZunDI=;
        b=DsQq4LKhRAsIeyQ1Akhm5j2s4hyDXB9tdl5NjfUVN+tfwz+H3ME+LGaqi1ZPZBe6NP
         Yh+2q4pzZV9gWMfSw7r/OdRc69dPkIMuynEW7boTlEDu+u7unQkFTGKFnvhx6/udvawC
         gV2wSR1YM0WVle10E/ban7W2Bjg2QbnZGYkp7aHA9dd+46GzSYlP5Z8oTF/d94k+zx9i
         QxMujOXsoaHEOqEYRim/Xssgd2GX3PEOiPdh9YNvPTptMXDYduAWCbKiGf455H1H7Q/Y
         x6P24LQ30LoGGGUcppPj7PIbi8xtZzODm66SzYzZ0VUkFBl0686PJL4WKfDfnVRMx24O
         h/5Q==
X-Gm-Message-State: AC+VfDxbw8UkineIvYDooE3q1EzzcgV3RNhDzUAPyhBajPBH2re5jnCz
        UEGzWrTzLkLZbCS+mRl5zfnQTxiuwbA=
X-Google-Smtp-Source: ACHHUZ6HF/6lDy9v3BzFvSeKoGkdghgPGr78j2sc1KKcCM2lwmz3LMQEYAF/TYUsT6pNyRfiKAzDhw==
X-Received: by 2002:a05:6a20:a10f:b0:ff:b9c4:a0aa with SMTP id q15-20020a056a20a10f00b000ffb9c4a0aamr2236086pzk.48.1683398797419;
        Sat, 06 May 2023 11:46:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4440:ecf6:7bf5:244])
        by smtp.gmail.com with ESMTPSA id bv8-20020a632e08000000b00528da88275bsm3534399pgb.47.2023.05.06.11.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 11:46:36 -0700 (PDT)
Date:   Sat, 6 May 2023 11:46:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2] Input: ili210x - Probe even if no resolution
 information
Message-ID: <ZFagieka6H2cRRXi@google.com>
References: <20230217025200.203833-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217025200.203833-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 17, 2023 at 03:52:00AM +0100, Marek Vasut wrote:
> Probe the touch controller driver even if resolution information is not
> available. This can happen e.g. in case the touch controller suffered a
> failed firmware update and is stuck in bootloader mode.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thank you.

-- 
Dmitry
