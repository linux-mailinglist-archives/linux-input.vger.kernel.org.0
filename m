Return-Path: <linux-input+bounces-630-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 386AE80AD6F
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 20:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E77BE2815D0
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 19:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021DF4F8A4;
	Fri,  8 Dec 2023 19:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2z1PxA6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BE6173B
	for <linux-input@vger.kernel.org>; Fri,  8 Dec 2023 11:58:31 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3b9d009df75so1626298b6e.2
        for <linux-input@vger.kernel.org>; Fri, 08 Dec 2023 11:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702065511; x=1702670311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SAPsKMfGHYizvGaugNOB97FodbuR8en0ngee2qpVWgE=;
        b=k2z1PxA6dYlHnTkCFaLalhkpZTXigsOr12BIyVu0i/RhVkXsllhCz7DTpHDe1KM0Cb
         uVnkg3N+D3StwOOkfSoE/w6W+LZvUCyZLmrUWlFuC3SKbF6Lt/rWuZFaBUhJAku8jAEs
         XBB1jL0BFh7sVGsh6pzRzXXPmQ2NqdtTJMxWy8utP2iIo5MmM3cjP8rPCw/SOGqo5ndK
         Hsf6qvdhFiHTe/W3D7boQl1w6GAqsuQzhcD9jcy68aFZk6IO9PjJpMZ0+KhtAENXIeTJ
         zqynxUNOFHPsS5uArCR1VlJCVz3plP4nqS71Iy2SoZ7h+ZGIEMQIC3zv45myBOTjJL3F
         vGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702065511; x=1702670311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAPsKMfGHYizvGaugNOB97FodbuR8en0ngee2qpVWgE=;
        b=pQueUIs2ZwafTiy81IDYDQYOsG2Qk4ciTPK8HwhLhZR3TIzF7fdkNSeh5z3FnXiV0p
         lBIc4WrVoacFvNuPqh3r+u3CxPaKRWV81bTmifKkpyu4ZUPLHxGqAAXwgfPfiF6xW85O
         UiClZUgv7APYWErlDY+O1bNhe0GXZ7mne7MvNGYtdIP7rSfVwwkJh62ZwtOXAgC8EXtt
         qNc21gtZ/zSPYoQ9T6leUvA6G/nAZDolkw0j6qA11pfl/SF4gbZ0OptHTUG1TCny8/G3
         ztuynRDwM6t5RkCMNa6hgQLmRhREpIKewEXQyEU8OMmjaVIcActOTAlvomuv6+CFYnpc
         Cm8g==
X-Gm-Message-State: AOJu0YwlcWbVFTIlUd7my8Il7mwPmA4NuPBslqPDB2tGUHkw9qGcWoVk
	HMHv6aPr0GMRGivRfa6qW7I=
X-Google-Smtp-Source: AGHT+IGou48yPACrpwqK0IJq8eoQOdh8bnMdWGysb0jVXkVCTq6d3teP/+k64Hfm3fGEvh6sdujBXg==
X-Received: by 2002:a05:6808:320d:b0:3b9:f3fe:2b58 with SMTP id cb13-20020a056808320d00b003b9f3fe2b58mr373920oib.115.1702065510781;
        Fri, 08 Dec 2023 11:58:30 -0800 (PST)
Received: from google.com ([187.217.230.94])
        by smtp.gmail.com with ESMTPSA id l3-20020a056808020300b003b8388ffaffsm452300oie.41.2023.12.08.11.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:58:30 -0800 (PST)
Date: Fri, 8 Dec 2023 19:58:28 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: uinput - Release mutex while unregistering
 input device
Message-ID: <ZXN1ZFYZBekXryha@google.com>
References: <20231207063406.556770-1-vi@endrift.com>
 <20231207063406.556770-3-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207063406.556770-3-vi@endrift.com>
X-Spam-Level: *

Hi Vicki,

On Wed, Dec 06, 2023 at 10:34:06PM -0800, Vicki Pfau wrote:
> Any pending requests may be holding a mutex from its own subsystem, e.g.
> evdev, while waiting to be able to claim the uinput device mutex.
> However, unregistering the device may try to claim that mutex, leading
> to a deadlock. To prevent this from happening, we need to temporarily
> give up the lock before calling input_unregister_device.

I do not think we can simply give up the lock, the whole thing with
UI_DEV_DESTROY allowing reusing connection to create a new input device
was a huge mistake because if you try to do UI_DEV_CREATE again on
the same fd you'll end up reusing whatever is in udev instance,
including the state and the mutex, and will make a huge mess.

I think the only reasonable way forward is change the driver so that no
ioctls are accepted after UI_DEV_DESTROY and then start untangling the
locking issues (possibly by dropping the lock on destroy after setting
the status - I think you will not observe the lockups you mention if
your application will stop using UI_DEV_DESTROY and simply closes the
fd).

> 
> Fixes: e8b95728f724 ("Input: uinput - avoid FF flush when destroying device")

This is not the commit that introduced the problem, it has been there
since forever.

Thanks.

-- 
Dmitry

