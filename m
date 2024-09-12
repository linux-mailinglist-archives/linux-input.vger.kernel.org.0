Return-Path: <linux-input+bounces-6434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE14975E93
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 03:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E76FB284D8F
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 01:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612FE282FB;
	Thu, 12 Sep 2024 01:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHF/XXra"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4AB3D64;
	Thu, 12 Sep 2024 01:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726105125; cv=none; b=cQngmYKQCYIgcvpIiesXa+YxylmrHDlvYmuyUkXzV8Qj9y0Y6dXSzjOFDXnx4W1x9XQIXOuf4ad8QWTw31D1Ew2wVY3Fy7ecLY/DJBE8UAOcyV5rX97EFBRXsvzeAVbQmMgzX+O0DdsxqVbrrfO38c0R12/jHUsSvSVHBOe9MiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726105125; c=relaxed/simple;
	bh=b3jY11fyglhhGGVft3uT9dWXgiMVMg28tki55Q4JNNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqCm/hT8lhPzJU2cfuXEo8RF4XfQ2hsn79qoYp8vAo4f/icmc/gosaDp8YvSq2SuSYTY2zyEuFVMtcQoYx6An2DWDqs1yCns72GmLf4hM/mDRhZh8M6Qvy4cHggGEbqzgIbWyDZbDFWwd1Bm1yGRmbmghuJKvrZvzslM87kgczU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHF/XXra; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7d50532d335so244630a12.1;
        Wed, 11 Sep 2024 18:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726105123; x=1726709923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI73LHVrHO8ZosFntwKU/shmWq1q4tipQPf9Cc1aomI=;
        b=JHF/XXrapa2LWjHM8NyHOTH4ZP4XXYl9emDQQ4HdolUcGM5yDwpDes9b1vOz7WDIAY
         xyp4301WJrz+TaqAJgdCq5mdl18jkN9puFgJI87Q4yV7+4FQHgYvZZxuxErl27VgY9/p
         ch9/Pq4LxGouuDxY/IsAJhtocOnzbLV7xUJRH4LmMEU6b1liikR53nZaG/5wcScG16Le
         cM8S/j3uqM3f27/jDDqz8XXn+N+x6+eU1QGRUCr7tiRH0RyOUaE3cSM2V0XnmEPEwpX4
         j6WIUPEu1Bzhyk2xx5azqua/4u973mWUT/M9BEvJxfCusbZIXGXmk9j99emZZZcRxlnF
         8BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726105123; x=1726709923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CI73LHVrHO8ZosFntwKU/shmWq1q4tipQPf9Cc1aomI=;
        b=oY/Ph9V2R+0B+q5ZTaYgEVZ78J9ggYgqNBNEJVqMpJGX5h+IRsy2aPpNFoD6rYhsue
         iCPel2A1XhBGkalMpSHL3DP9r5KUYxQ8MNPXIusVfjwjdVTkk5G/6rQhvcYiCfVXxk4B
         0iyKz1oIVj7lUWGSXsg1UVKuF283NyM4oEe4+g6dwc7a4VFs+87or5xNKjth9OpPVmfD
         cmBdrGzb8ZPGqI/StGUzfu6PlfAehbZrumYs14TEfjfO0PL1sQpkCGQfL8Pscrf6LwfA
         4hECUrJwR3/vxCCghitSZnpwl2AxuH/ri4blaAgJCYXAqLsrpRjMdJ8a0B4rSjJfDaB+
         CFAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOOQedFH96eOKxd6ncH40JVnB1vrOsm3Hb+p1BHxmyol91NTgkfdiGOQx2tI4owtUYHvJV1mGjP7p7Ew==@vger.kernel.org, AJvYcCUV77yGcVuLe6ndYcVw2pkPGIwYEaQ74XdD9uwp0WqzlZ/r2ikYsVhJ5vYKyufSuJYTj3IeWd5k9/AhRURl@vger.kernel.org
X-Gm-Message-State: AOJu0YwElfDQb1lOru1m5KuU81cCUdbMhzHPazvvLFRznMFT2GjQOWhQ
	IcON5I35lnaTWNaa+4nsMJxNU8TvKiG5bgDP+mOt4/78cr9/3JHIADMRSii9oClZY92jY75DDQC
	zabFdRGX90TLt8ZLw2+rWa8vbkXrSd1QpxUApBg==
X-Google-Smtp-Source: AGHT+IHoLTqhsbCq4mLfUg4DaQaWrqPGNO4amFDEOjdmJ/JbcYai+vsyXTUN4SjcSkbz0S4zt/2GNnYotNBSqpjlxu8=
X-Received: by 2002:a17:90a:17e3:b0:2d8:a731:7db0 with SMTP id
 98e67ed59e1d1-2dba00681a7mr1195367a91.35.1726105122908; Wed, 11 Sep 2024
 18:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818072729.33511-1-vishnuocv@gmail.com> <CABxCQKtfFttYVpfZE0jsjt=xgO4EJ0vNeb4Wf-==xOr3XnKnxQ@mail.gmail.com>
 <nycvar.YFH.7.76.2409111418330.31206@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2409111418330.31206@cbobk.fhfr.pm>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Thu, 12 Sep 2024 10:38:05 +0900
Message-ID: <CABxCQKu57UY9q5z8a_1Adb8pyGQwMrFYv0+vRL==YTo-v-fOzQ@mail.gmail.com>
Subject: Re: [PATCH] Adding Support for Thinkpad X12 Gen 2 Kbd Portfolio with
 0x61AE as PID
To: Jiri Kosina <jikos@kernel.org>
Cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the acceptance.

On Wed, Sep 11, 2024 at 9:18=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Tue, 10 Sep 2024, Vishnu Sankar wrote:
>
> > Do we have any feedback or comments about this patch?
>
> Sorry, this slipped in between cracks.
>
> Now applied, thanks.
>
> --
> Jiri Kosina
> SUSE Labs
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

