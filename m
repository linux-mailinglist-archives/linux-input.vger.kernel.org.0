Return-Path: <linux-input+bounces-10544-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFEA4F21B
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 01:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B2D916E7D4
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 00:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7AD4A06;
	Wed,  5 Mar 2025 00:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1msvOyL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E921B623;
	Wed,  5 Mar 2025 00:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741133323; cv=none; b=r3h1qPLtDskcWhzUB6KLSOWg3PxVA/ncQsKYe2JDbt1M2MFAz70E110Vv8FL4JKVeCbal2+/zP9dv8/fGOhCrWTeyI1mHXgmfJuC/n3UTJHp0DoiYY2zVMa/besS6cxfVCGEHVwufDAxVeETNjwf/DH9uet5SclBse9qsIwM5r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741133323; c=relaxed/simple;
	bh=6mwRkJBdUpqCz9j0TicCbXNz6w2fOjJvAz77w6oRb6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkvixXKmJFcCVC+YUobuN2DMT+UAvXT4ZjvmENteOiffSDbw73SmtnxgLj2qfSy7Z1BteDKGn+drW6kOCMn9xirn4JCycWiSSiB2dtrSPyFOdGYOzkysUufYnl3cmFXDttGiOVwJd1u7YVz1qkJAAnQY6/0Uu6yWxbWk3RzoVzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1msvOyL; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fe98d173daso10006024a91.1;
        Tue, 04 Mar 2025 16:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741133321; x=1741738121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4350roM/gj3VAWFs+liAW7PoBiV6xDBAwhQEaWr7LQ=;
        b=O1msvOyLCtgT5JagNOkIdR+OV9AU9BXzcP4WK5iA677wkN8a0s7XZv6C+uNyGU5NoX
         y37QmgDB/0t3KLvZwpW6IFUDNwiFahWNzsEJLHOCV7UYub2XutxkeaLWaMKu0hZJglR7
         grUl4HSmLhu4A5poYRxQjo7pDmjhbb7bhvSMj86ed2jmVlomFsy3y9E5FIeSZGWTheMW
         pt6obtDyYaSDwM0xu0DXI9HTN3lhfUrpY3Ko1cC0PGarB0j0kKyxuuXCcQ8EELSwUPHe
         BjBm04wE2CphUGt5wNkorMu58mifI3AzLwxeCRflDcv7Ys0+UtS0HwrkcZkwul61ymr0
         9sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133321; x=1741738121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4350roM/gj3VAWFs+liAW7PoBiV6xDBAwhQEaWr7LQ=;
        b=EzW/ipWsns4yzVEWRgnPUrqzG6bypEvYthk8pAY6fVjmg0qWa7FyssKg8YFt4sKH6m
         2Vwfyyo+YdALQmKyHyVO6LOTNf7g2e52/OyE2FNHkLOQKiC9htLn4xAjaSfthhDweoou
         wK+A8jzAEGHcjEHht+4GBdxAEi68L4AbKWLtL+wOpoixB7joTvFX/BbVwmkMDWvLvkRm
         Td+0mUvQg3Y0kD+8kP1tIGVvXbkZEnKJcgYgrwOSSPPJDK/T7JN9Og9FmrReI3x/yWkW
         GJXvAri3TTMf41nCl6DAxAKrgCYPBHvj2nhK5r9+vaTMwP675VcPEWXrFmkOzP+7qKtz
         iwqg==
X-Forwarded-Encrypted: i=1; AJvYcCViZHhmcpHUOgFCBYlZk526WwRbb4f0t0J5awN3RyaSr8mUT38jBEeno9vNbnKldP5jCfE67NRUtANXxQ==@vger.kernel.org, AJvYcCWl7pWpK/xhDOnGjUfwnHf6/OLk7uFnexUvbAg/+VyDuvEYuBmwxLiENoZMyvlDFTIX8AkLuAr42JYMzxCu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx2M1+YvSm859J+4AB+uVomSHA+tQ4b+gXZcmUVzCqDgASCFFa
	mWNugUfvAouMwIFpY0e0JT4mZHE42lOiurZWvLAuxGrnYYWKSdD+DXNYu7Ud6Qvnh9JLA8wfnyh
	EBB/eAbIUIWmAuLN/luOIoJq3CyQ=
X-Gm-Gg: ASbGncu1Y56Q9+8hnJ3VgBWcO+WfIdEuNIIPOuj6Cv+tjN0nik6GVQ/E8lfHx4TopwW
	TEhKVZJ9nxuPzO+qzZaQc5xH6GgNV5bPFQlILm2wsBGivwlTngRqn7niW/nMDN4KhytPYqdvOpk
	nYSIUGe8CeEb23aHrrziYf9onzCsPn
X-Google-Smtp-Source: AGHT+IG+oOEjE5uoT8UInsApAE1fahwjxok7BWK9G2aQR8MUL7AK+HTnuW4AwWIHbpCYFMEouOhUXNITc61DJv0utts=
X-Received: by 2002:a17:90b:5743:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-2ff4975abecmr1867817a91.5.1741133321074; Tue, 04 Mar 2025
 16:08:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114004159.102555-1-vishnuocv@gmail.com> <n82p6032-740p-0o56-n808-99n5rpn9no23@xreary.bet>
In-Reply-To: <n82p6032-740p-0o56-n808-99n5rpn9no23@xreary.bet>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 5 Mar 2025 09:08:04 +0900
X-Gm-Features: AQ5f1JpeU7DAYR9Bjapit_Gu5xfIFvZ4wzld0zm8_FSC6gaRjnuGWo9TN2eV72M
Message-ID: <CABxCQKuxA84swVQ50J7QCwR+raWP=9a73db6uenUnBVxc3O2+g@mail.gmail.com>
Subject: Re: [PATCH] HID: lenovo: Fix to ensure the data as __le32 instead of u32
To: Jiri Kosina <jikos@kernel.org>
Cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, 
	Vishnu Sankar <vsankar@lenovo.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Jiri.

On Wed, Mar 5, 2025 at 5:13=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrote=
:
>
> On Tue, 14 Jan 2025, Vishnu Sankar wrote:
>
> > Ensure that data is treated as __le32 instead of u32 before
> > applying le32_to_cpu.
> > This patch fixes the sparse warning "sparse: cast to restricted __le32"=
.
> >
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501101635.qJrwAOwf-lkp=
@intel.com/
>
> Sorry for the delay, this fell in between cracks. Now applied.
>
> --
> Jiri Kosina
> SUSE Labs
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

