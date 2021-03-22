Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB20334532E
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 00:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhCVXrR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 19:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhCVXrC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 19:47:02 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A51C061574;
        Mon, 22 Mar 2021 16:47:02 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so11384675pjh.1;
        Mon, 22 Mar 2021 16:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nTBBhmelR1rKo5gpZ5/I5W3hX2Ley4SJuwRF7oe0/Uo=;
        b=pmpe43RHvzUwxIdVH7L4bLuRUm0MR7wFvxh+28rhM0c/TuvZ5TzNgtE2uVmL2rMNuX
         21YNRyAIV7Uum3EW9ZIYxarOmbQGT1MSacIYqxy6SaQboja20ovDTG4DLQvFzUne3cJ/
         UHxAP3YOiRSSL4hx9cc73J5Q64G75EGRj4HSaWBlchgyb4ExDK5KE0CeLDDaQx83Xy6K
         OjyljZGf7FGkapm7uyUKgvVV3Aht7C+nAzMOyNROfpKbOLjMgfKP9PJ9xtCVehLMOARk
         53bQjGFe3ZuZPTijqyzBA0z3j2FmfAYsxv8fJWduY4pWtl+RR2kRSF7Zzl+G0Q6oDmGM
         8znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nTBBhmelR1rKo5gpZ5/I5W3hX2Ley4SJuwRF7oe0/Uo=;
        b=QEd4PQ9vUSj1NXjHbGwUYWFmXv0auiixU10h0QlaSXmmutSXYrHrf5w0p2SNUMeV+m
         nrPGZEA/LpcpFXTYWWfPgkfPPyQ20rMGvfiNdDBhIVLV9q/9wKYiKGl3IUor3JxX8LKL
         c4uByiXhSJQWxbWQnaw3P+bm7Q/AfhkdDNna9HBVKX6Wy4iOn9KvZ8V08L1g6RYW74qn
         4jYk1odqKZskMsRIkyqQzYiRteLSgZVOViN/O/lo+9x6NqCSi+IXJL55puYCTCtMdrkZ
         qRWzf49LccuZNyV2itd3Ci1qZkEbKYHHYCdxYzOYd2MCyHtKyKL1UacTulgZWTgQ+oOY
         +K/g==
X-Gm-Message-State: AOAM531UICgmkOdHr8UifEQZIcaeg92Os9Jt06IxK9g68mW9J+kaZQZ7
        vLfvEGl49pwYFsUtfxvzpXQ=
X-Google-Smtp-Source: ABdhPJyvw3DrORkAXL9RkCVyKATXJHlHMujAtYCX0EloNaGi41xv5aVFjrJ+1azBEjwn+phFgJGH8Q==
X-Received: by 2002:a17:90a:f28e:: with SMTP id fs14mr1499696pjb.100.1616456822215;
        Mon, 22 Mar 2021 16:47:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:499f:7361:582b:fd05])
        by smtp.gmail.com with ESMTPSA id i20sm12905012pgg.65.2021.03.22.16.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 16:47:00 -0700 (PDT)
Date:   Mon, 22 Mar 2021 16:46:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] Input: touchscreen - broaden use-cases described
 in comments
Message-ID: <YFkscpkPZUoXvDuC@google.com>
References: <20210301234928.4298-1-jeff@labundy.com>
 <20210301234928.4298-3-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301234928.4298-3-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 01, 2021 at 05:49:26PM -0600, Jeff LaBundy wrote:
> Now that the helper functions have been moved to drivers/input/ so
> that all input devices may use them, the introductory comments can
> be updated to remove any implication that the helper functions are
> solely limited to touchscreens.
> 
> This patch also scrubs any remaining use of 'DT' since there isn't
> any actual dependency on OF. A minor spelling error is resolved as
> well ('setups' -> 'sets up').
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
