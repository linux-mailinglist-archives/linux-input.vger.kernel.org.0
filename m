Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F10345330
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 00:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhCVXrP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 19:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhCVXqu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 19:46:50 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103BAC061574;
        Mon, 22 Mar 2021 16:46:50 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id l3so12371254pfc.7;
        Mon, 22 Mar 2021 16:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=09+31lJGk4pQDs+oaALD6jYkKw6EtoWBarcquy1OJGI=;
        b=OE3gekNyuaj7RWXNiph2mgyGOKZo3kzf2mRo75nQtfhkVHhueNXBFtE+Nf9wJdZ9rU
         vhDrIiLPJSgqrZylIzF69eVttuFH3L+bhAzxIPWTxnc1ZunRpkuDsLvrUJKhnYb/JHA0
         YbMAKNrTCN4cW7pvIg0p5H/vfaqxesUG9SutRZ5RnRI5ccA2rhTrqR1sb/X22EOSycyE
         77yXg9U0FCf2En0tFs2q6EXKVyRJm9in0cgFbB8cvHQwbhBkQu1GeGbLAVloLMuBpU8v
         0Gmo1v8AMsyPy0PJit1qrNsZIvVg7gAdRjjW59+QVjtL85NiW9tDEwtQ5twxhTNl1eDY
         vX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=09+31lJGk4pQDs+oaALD6jYkKw6EtoWBarcquy1OJGI=;
        b=leqQIC86bJcuAp+IUF5SYg8D2TTxY/EdoWHO38AKq1ZxtmXpQt1mkofVUrGcuPcrrF
         oLVhjI5U7spdFDBdwicqR4cselbQUaIkfg1KqcEhF5EHIDFTVBtaVrw74XnuyjlTln6t
         XaM2Ix4HNHu3qf8vPkVKPQvqD4+RklVHFLLlZ1GY11DDWZhv2uLQ/QXs/tVNUALUKLam
         gDBjGrWOkk/EfraLzSQ/fmQwmIy6gIGl4spKCpG7BLqAKAEEtmj/xCjUhLPhJkrQEHNu
         MRWUu3moMtebu652TG+IDODR3evIUguQJgUULF7vkkIR/AvWLNy5JsEoCTNSRzI+WmO1
         kzdw==
X-Gm-Message-State: AOAM531bnAZUUc57Y4zgVIhhvWW7/2L5AfHDGFV3n/q6WJrMF5OJi8gJ
        vJ90qTvBN+oj7vf9M0MM650=
X-Google-Smtp-Source: ABdhPJznS9lEo4jrHlFoJkrWtCOVdK27HK/JjYmA1idC+eIuo+nwxZJQ+WjWoTuwuJkBtNmJI36hNQ==
X-Received: by 2002:a62:3384:0:b029:202:ee3:f83b with SMTP id z126-20020a6233840000b02902020ee3f83bmr2154552pfz.77.1616456809405;
        Mon, 22 Mar 2021 16:46:49 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:499f:7361:582b:fd05])
        by smtp.gmail.com with ESMTPSA id a21sm15039987pfk.83.2021.03.22.16.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 16:46:48 -0700 (PDT)
Date:   Mon, 22 Mar 2021 16:46:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] Input: touchscreen - move helper functions to core
Message-ID: <YFksZVZMjEqGViPm@google.com>
References: <20210301234928.4298-1-jeff@labundy.com>
 <20210301234928.4298-2-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301234928.4298-2-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 01, 2021 at 05:49:25PM -0600, Jeff LaBundy wrote:
> Some devices outside of drivers/input/touchscreen/ can still make
> use of the touchscreen helper functions. Therefore, it was agreed
> in [1] to move them outside of drivers/input/touchscreen/ so that
> other devices can call them without INPUT_TOUCHSCREEN being set.
> 
> As part of this change, 'of' is dropped from the filename because
> the helpers no longer actually use OF. No changes are made to the
> file contents whatsoever.
> 
> Based on the feedback in [2], the corresponding binding documents
> (touchscreen.yaml and touchscreen.txt) are left in their original
> locations.
> 
> [1] https://patchwork.kernel.org/patch/11924029/
> [2] https://patchwork.kernel.org/patch/12042037/
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
