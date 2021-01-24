Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12C8301F0E
	for <lists+linux-input@lfdr.de>; Sun, 24 Jan 2021 23:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbhAXWKV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 17:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbhAXWKS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 17:10:18 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2988CC061573
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 14:09:38 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id a20so4193531pjs.1
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 14:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f3xVC24FODxLFE+HoPqbRiASYr03r9qeisjJUUj5hTM=;
        b=jG5dugglpN2N/PwKtSbuuy/Il3L++MOKdLDpRjwPrA0pN/DSO8zJta65eDTeXuxHYv
         Gz2uXV440OI7dlXKfF8faoVVHXspvBkH5rMYgN4m3amb97vF9X3EZaUSlKm7bJRhUzOQ
         +tKLxmgMLPhpI/vJIdt+wpIdmgGLn+Xya4qGNfXDleelKNpAXIT7itcNOSGIwsqE3m65
         FNwuU1LZc3voSyuWhAbWD7zcgFzwT6JNiFAtyToqcOe4b35QCaHh2BeacypRF+SeaIkr
         LrDyWXpgsaLAeBrVethMPtXcX9P4cQa0c2Nf5XbkbP1EcYM1DqLNp4siId3FqjqKQ9Nu
         BPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f3xVC24FODxLFE+HoPqbRiASYr03r9qeisjJUUj5hTM=;
        b=Kv1G3BYYZzneuSTPaIkaR1pX2KZ5GptcrBNyImEpn2YpUXSoZRNPi6AHb25mYm0GFT
         iJU+hhHR15W0lj4Ow4KCnswGjNhiNXha+nHGl1n4/rhCnaMGLPInou0TJ8g3r11I5LhI
         3s22DIK66C/EyHcMI4SrnFI4bhmU1LYUPh2jI8TY5O+LSnwohNEDRFZruXGhkv88Mtmt
         3pqWba24skHmOiXouppHsN9imcX1B6+7bhN3luvOahRNjNGi9WFdhctDD/C+vzadTD3U
         s+LQ8ZZXGWetPQ7zTqhj5x32K8lRb47n3hogh0eljtzZYTl234f4VXymI9Pz5S5tyvtQ
         HRGQ==
X-Gm-Message-State: AOAM533CXdIEbaX9JxGgVcCiNYTdoblyQbKeRJ6RE0bCkKPR1/YKze0F
        zr5KlXA8P3jRp4AdzaH2Koo=
X-Google-Smtp-Source: ABdhPJx6CHRm4AFW85dR2J7eC3xuW5IYC0QDAELmatcRYpUD95HPsMI24UZUuYU38g00XcvJShSgjw==
X-Received: by 2002:a17:902:ed8e:b029:de:8c17:f7e8 with SMTP id e14-20020a170902ed8eb02900de8c17f7e8mr16192424plj.19.1611526177683;
        Sun, 24 Jan 2021 14:09:37 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id u12sm13660946pgi.91.2021.01.24.14.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 14:09:36 -0800 (PST)
Date:   Sun, 24 Jan 2021 14:09:34 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Valentin <benpicco@googlemail.com>
Cc:     linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCHv2] Input: xpad - sync supported devices with fork on
 GitHub
Message-ID: <YA3wHt2cEHC9Ombm@google.com>
References: <20210121141602.7ff62580@rechenknecht2k11>
 <20210121142523.1b6b050f@rechenknecht2k11>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121142523.1b6b050f@rechenknecht2k11>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 21, 2021 at 02:25:23PM +0100, Benjamin Valentin wrote:
> There is a fork of this driver on GitHub [0] that has been updated
> with new device IDs.
> 
> Merge those into the mainline driver, so the out-of-tree fork is not
> needed for users of those devices anymore.
> 
> [0] https://github.com/paroj/xpad
> 
> Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>

Applied, thank you.

-- 
Dmitry
