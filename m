Return-Path: <linux-input+bounces-7155-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC3995267
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 16:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8EB7B281CE
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 14:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E951DF755;
	Tue,  8 Oct 2024 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoMBk8ic"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690EE1DFE26;
	Tue,  8 Oct 2024 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728398805; cv=none; b=ZEDdr6IbpIsh7ftXjmjQUfClMU9aSZaQzfK7teMZhPDOPa2ZeVPMXaYS8wtZkmTNEAWyXahf6l5MjgKuYMdK2+n5MklMHoY+QHTivKVrnCcaYxUpxE+ClLwxPLXlLPKMwXmw31+aiC8/rJW5l6aF1gD1sBDqrYG7bYB9cKeUN1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728398805; c=relaxed/simple;
	bh=t7reYDaFo9Rda3OtxbSUU+NHXihYmWlZHjWEb2HEvCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOiAGNecU+3fSAN8L42S4RO8CSywmROdf9mQTivJrDv7JYvHiK/iz0i23s5HGTuZkbPxrqM/n8Gn8898SDH4rZ5S0WuXSkSM5NwC/ZAANGlL3UMmA1yLL+tC1/7oSV88B6KewLF2DtUDBeAd6SnMGDGHl7yscXL726fJ4978/6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoMBk8ic; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37ccd81de57so3837954f8f.0;
        Tue, 08 Oct 2024 07:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728398802; x=1729003602; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t7reYDaFo9Rda3OtxbSUU+NHXihYmWlZHjWEb2HEvCI=;
        b=DoMBk8icnc+Wr2jUB+FRiPK0/fR5/45Og5MRe6JJ9kacf2slgqqVunOMoQn0zK4m1G
         pdgw9ngZI1hP70Moe0qxInWQ9QidHZJOBMBRLsXtW79wBv15otrAC2jkf/vbtxoijVxe
         U8TVjNnlTuQ5SFWj//njmRripVlMjH5PkzkgGSgjarwdRvi2rPRslvXkq/qbHXZeXllf
         BTyrrs5FC1tqUqbj6s/Diq/h3ioZiuBDZ/J3NfXQ072uTLxvRZLJuaqI+1185JtZF3Ne
         hhLi8vsGe29RIRxeGCQe4W196WOzfp2v+DyfTHrOIsIICAovR/XAD48qwGOqG7bZlvTB
         MFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398802; x=1729003602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7reYDaFo9Rda3OtxbSUU+NHXihYmWlZHjWEb2HEvCI=;
        b=fXo570f7jLktppZbsITC5CrYeEH3suM71MeQIqkDGuBIC2Xq13ONDT+z/FhaL4lrlO
         a14dqIOkmrEdsIKgcLGjDgVEDyM7ESv+LqJ7vD93H1mzZboTGYHZuCpIGYNcLgT8aqY6
         SnrCibNRLLfEZWo0kVoDGli9smwgsQ+jML++fc2q4TsVoBm4JLvaE4m4EAjPouyELaNM
         D61Pp2dnJCgCbvfB4Tb8kjTx+Z6Y1apTwjKZM+vNprgHV+9/o6KuBkfHsulMP/fJ4yfF
         utOYfSm6Y1J29i2WXfnX+UhfX9k5hXFlmt5WHrICxiHU6aPxtfgcPmJq1MGfBgaSsAvq
         vrBA==
X-Forwarded-Encrypted: i=1; AJvYcCVn8wBQYHo501Y9BvX56uVg8Phw7i469BKjs2Blm0p9ggdbe4TbRMcCngQdXZf42f4O5ZcDzniwuHuIJYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3Mjbk0AzRcsZjEaEShA9zIJCcun1S7bPFk7XtcM0mSHlFCr7
	lxBeC8S/zYJE3YWC4FTXe8ir72mnCQ54UreS8el8NoegHVkQw9A5o42sKyHCARg8naq4ASs1LUe
	8/aQ7pB8Mh7lRWTRRXkKi8NEOCdYzuQ==
X-Google-Smtp-Source: AGHT+IGYqMUH6jKO/1Woi4hQyrtWTYGBGZhGwOBCJp6MTHUHRAC7eEDLVWrplsSBgQIt9v9QmGw3GM6S0i3wfPLLfWE=
X-Received: by 2002:a5d:6d0f:0:b0:374:c613:7c58 with SMTP id
 ffacd0b85a97d-37d29351dd9mr2851644f8f.29.1728398801519; Tue, 08 Oct 2024
 07:46:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909184936.32489-3-stuart.a.hayhurst@gmail.com> <nycvar.YFH.7.76.2410080855470.20286@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2410080855470.20286@cbobk.fhfr.pm>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Tue, 8 Oct 2024 15:46:29 +0100
Message-ID: <CALTg27=U4bR6shPcQKz5vCm6uYWn68-5=hv0Mm4hAc+9BLK4bQ@mail.gmail.com>
Subject: Re: [PATCH v4 RESEND] HID: corsair-void: Add Corsair Void headset
 family driver
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> As we alreay have general CONFIG_HID_CORSAIR, I think it'd make sense for
> this driver to be encapsulated under this config option as well (it'd also
> follow the general practice of HID subsystem, that the drivers are divided
> per vendor) -- i.e. link hid-corsair-void into the final hid-corsair.ko
> whenever CONFIG_HID_CORSAIR is selected.
>
> Would you be willing to make that small change, and resubmit for final
> merge?

Sure that makes sense, but I'm not sure how to do that exactly. Is
there an example anywhere?

Thanks,
Stuart

