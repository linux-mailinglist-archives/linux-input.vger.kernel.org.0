Return-Path: <linux-input+bounces-5718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5319591F6
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 02:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 422CB1F23B32
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 00:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424CE18E06;
	Wed, 21 Aug 2024 00:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbMVYLQl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6AB2599;
	Wed, 21 Aug 2024 00:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724201563; cv=none; b=RpxxpmH80QYyRh9BYcP+ZMcYcPDYJd5Tn0aXBkX5fxRaRfBbaUuJugUQlyuPvkniB2ysG66NhNScuQPo4tzVlMWp8kvG9U2o9y1aecUd7FJdgdTgd3n99UoXbEbHcz06DykAV4dKmP2IvVcMW/8F1S2PQUyFtA3/xuvu5tC47dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724201563; c=relaxed/simple;
	bh=uh1TQaj1Jq3LRiBgl+QrcrdJaxmJ4N2KqBz2SU7o970=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqeiovcMJ06TaUHpKFp3t+Z9cPN36XDR8xJ1n/3JUYV3SQSq/7nmEw7YJsT8P6MankYjB61kHucCSKkMq0tDQmpXE6RLkRxjw/hHiysY/Cqrr5P+xEkbIbBvdmU+mdbkS5zlp8vLjTGyUkbZfIXYKBCD29dkny+CiTUf9gm9w6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbMVYLQl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37196786139so3067283f8f.2;
        Tue, 20 Aug 2024 17:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724201560; x=1724806360; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uh1TQaj1Jq3LRiBgl+QrcrdJaxmJ4N2KqBz2SU7o970=;
        b=jbMVYLQlgtcVI/2/zLDfchk65JV7/K35M5r355HVc/MUhta+cBbEJggvCuEeUgVVPR
         dsFQQ8U19J0IbBS9DPbGo4wuvzyl7Qfu7YcDGGtgtJP1/gR0097Nd4XILPu9i8Pfd9HO
         ZFQsgtcsRpJCknf5dwTvfteHwRohAMn1Fi2ItciSOyQAWhtTz0l2KY+PpDAxKBXAo8bD
         mrMMpsNMjrdY61QtpERbSFlD7Fuopkb6lI9RR9HQJi2Qdg3X4k3fPyRRV1ahJfpjfPAS
         hhsGBKqTOPprcQIIMGx2r7awh4+ekn87ZLynbpa96U1qdnrN3JrLPpFVp+9mnUfiBzaF
         k5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724201560; x=1724806360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uh1TQaj1Jq3LRiBgl+QrcrdJaxmJ4N2KqBz2SU7o970=;
        b=H6SXdfxLreNo/hbsAvaMSbIFNQxKU2iNR30aFYrSQbBYvSkGpHNYF9DX5YTLJB/qZ9
         x2FeFpZhj7RXMMus/ZMdHNhAXJcWHZnAYy7g+1oWEXdQlGXsbd/jUCkjqLfLMTFNWMgY
         8XoiGrWEMW3hiVTmVgX5mZW2qUbnmBFT57fLD8pNxUg/QGsAsS8sDAz7Ty3f3SxHy/2/
         GRsjXNnsYurNSXfvoGztY7JCT156E1pCsWZwdCKRzeSq/BmkzvTg2vMqGVN1+rFf0ZbJ
         jrEFRNY51xIJzEk/QR2T9y/wOI9t2fEj9EE57DKIHx6LOh/eaP4R+eKr1xJaJWDgjgTQ
         Gz9w==
X-Forwarded-Encrypted: i=1; AJvYcCXJi/p818MGqVsfpFcno2Ar5nTOLcaDmNyjobMkCSXvDgCSfKVSgXOjUxlofHEkxO4eueXHfAtL5ZnGLJjU@vger.kernel.org, AJvYcCXVhiXxtaeZKWm5CCrpnPO93h4im1xARcYn28Kftt3vNB1XHje1fUVh//fC3Q21dnokssZBVu2UzY2XAHzAg6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1JMkL2Ontu7FvGJSU3d1MscGsccOKZiE7JxYy1DP+ZO25hLSN
	83Bb2TtKhGpy7dHYomglkND1qpt5YchTnLUUWISH4x+6k/olw0LHSzIHuUpPk5ExmtOvUSxgmIj
	oOKnh7x13Fig5X+YZlYjmxYhNKS+5Ssn3qJI=
X-Google-Smtp-Source: AGHT+IGYxXeO+iqS77FNlbT1rGlBh+YFfmDUvGGhx72BalywZd/UFxp0zqRD99UIhKfxVDzaLHz1o3LuHVXx43l1Go0=
X-Received: by 2002:a05:6000:402a:b0:367:8a00:fac3 with SMTP id
 ffacd0b85a97d-372fd5c9989mr395304f8f.30.1724201559168; Tue, 20 Aug 2024
 17:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com>
 <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de> <CALTg27mgOx3W3WENxFh0sEEeNYKEjrZCEQGoBi9=vjgiaZnZtQ@mail.gmail.com>
 <65b8f7e4-358f-4943-8ce0-c28e4c947016@web.de>
In-Reply-To: <65b8f7e4-358f-4943-8ce0-c28e4c947016@web.de>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Wed, 21 Aug 2024 01:52:28 +0100
Message-ID: <CALTg27nu2_26WwFKc2hWbWY9B40QQLxJ_bM97OWY9VoRo-d_FA@mail.gmail.com>
Subject: Re: [v2] HID: corsair-void: Add Corsair Void headset family driver
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> This was the case for a while.
>
> Increasing applications of scope-based resource management provide
> further opportunities for smaller scopes according to some local variables,
> don't they?

Personally I'd rather it just fits in with the rest of the kernel,
but if the general consensus is that new drivers should use tighter
scopes, I can do that instead.

> How do you think about to collaborate with other data structures
> than character arrays?
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v6.11-rc4#n953

Hm, I picked a character array since all it's doing is sending a
buffer to the device.
There's no published specification to follow, only "Well the Windows
driver sends these bytes and this happens".
So there isn't really a structure that really comes naturally,
especially with all the magic numbers.

Unless you're suggesting I just do `unsigned char send_buf[3] = {...}`?
I checked the docs, apparently I misread somewhere that
`hid_hw_raw_request` couldn't use stack allocated memory safely,
whoops.

Thanks for the review,
Stuart

