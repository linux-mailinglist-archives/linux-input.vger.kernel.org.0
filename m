Return-Path: <linux-input+bounces-1101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F4117824398
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 15:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84253B2186C
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 14:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3742324216;
	Thu,  4 Jan 2024 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JwasyGJY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33D724204
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5570bef7cb8so519810a12.2
        for <linux-input@vger.kernel.org>; Thu, 04 Jan 2024 06:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704378014; x=1704982814; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J2cY6zWShul1SIbFB6HGxgmdGVwD/4l6dAmhSfaYtSQ=;
        b=JwasyGJY1D938UoYPKopm1KyCqNoTzV0BKSNgY8VQ03MGondmSCsI5kD56aVw3iWKy
         yPDYdB4kMdDsXJ12SPXE1a5EEZGKI6VzmFN39h894bsNRNFmi4JW9Epzh2uvBnHPFROG
         NZJp6b5iw54hfzoSq0fJ7Z1oGz4u5BABAGLpkKzwaLSkY+n/H2RBenHgyIHSuOdqcizq
         7C4TpGkl+iAic6s3Hw+zNFrR1TOrE+hV0JgS5+GmivWtqJIvdJuC9+ASBVZLwx1dNQZj
         sAo3rPGpnKwbJECw+XzK3rXuoe6EIXbC6r2EU4JhU17T5LlpZHz7NMhbbsJMuNp52iRh
         6xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704378014; x=1704982814;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2cY6zWShul1SIbFB6HGxgmdGVwD/4l6dAmhSfaYtSQ=;
        b=p+DRE3dy7qG0aduTZBBmP+Mwt8HaAmzSTAq6sNjCenGU55ygj+UkvM/u9CfUW3oxWZ
         H7a+xOXRj91pXGfdWgQOTi8uw68ikBNqmrjuuXyhhdS5xjY4Pi8h4YJ+MyWAYv7LVHU0
         vQhWkAmUdppSNwj9O4Ox2PBLxw+3MxGmNwio90stFslBbw1xbpDhh80hOKU8iy9XFfTW
         TJV+hwGtICTiz1Weer2IGZNPxHYM9WEfLW1o37mgPBJYyTU6tbd0x3B4JL2HPFvv5w8+
         KxOJLpRFcpRH+7XxhEIcbbKY+dJITFzb7Smt428mKpaX/7k3B3EXb+IEpAmVa1g0/Lvz
         iG2w==
X-Gm-Message-State: AOJu0YxuTD8RHDne8S0ojmoe3VbB3x4Tn4r4aiQKMVkWYRvI4XzdcQpi
	+Cxko07ooA8QFQkFM8GtRMKMqwdlsfXpjQ==
X-Google-Smtp-Source: AGHT+IEG9nXKk8rC3+RM8cy5cmvIsml2aOmCNRsY0QyKtk+dw0X1Hkvjef4+u27D3xVRvF11gdWPcw==
X-Received: by 2002:a17:906:8412:b0:a27:45a2:e5f4 with SMTP id n18-20020a170906841200b00a2745a2e5f4mr346528ejx.14.1704378014046;
        Thu, 04 Jan 2024 06:20:14 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id fp21-20020a1709069e1500b00a26ade46619sm13029321ejc.121.2024.01.04.06.20.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jan 2024 06:20:13 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Thu, 4 Jan 2024 15:20:15 +0100 (CET)
To: Hans de Goede <hdegoede@redhat.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
    benjamin.tissoires@redhat.com, ilpo.jarvinen@linux.intel.com, 
    mario.limonciello@amd.com, linux-input@vger.kernel.org, 
    Patil Rajesh <Patil.Reddy@amd.com>
Subject: Re: [PATCH 0/3] Add new SFH interfaces
In-Reply-To: <c4d8c0db-e125-4d2c-98d2-59cd9ca7ed11@redhat.com>
Message-ID: <nycvar.YFH.7.76.2401041519390.29548@cbobk.fhfr.pm>
References: <20231220070042.610455-1-Basavaraj.Natikar@amd.com> <nycvar.YFH.7.76.2401021122350.29548@cbobk.fhfr.pm> <71296fab-d6dd-490b-b29d-468f0eecb244@amd.com> <c4d8c0db-e125-4d2c-98d2-59cd9ca7ed11@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Jan 2024, Hans de Goede wrote:

> > I am yet to submit the patches that uses the new SFH interfaces
> > defined in this series.
> > 
> > The suggestion from Hans is to have the SFH changes landed
> > independently, so that Hans can take the PMF changes alone later
> > during the rc's as fix. IMO, we can have this series merged first alone.
> > 
> > But I am OK to have both PMF and SFH changes together.
> > 
> > Hans, what is your feedback for Jiri's question?
> 
> Jiri, originally the drivers/hid/amd-sfh-hid/ changes
> were posted as part of this series:
> 
> https://lore.kernel.org/platform-driver-x86/20231204101548.1458499-1-Shyam-sundar.S-k@amd.com/
> 
> specifically in these patches:
> 
> https://lore.kernel.org/platform-driver-x86/20231204101548.1458499-14-Shyam-sundar.S-k@amd.com/
> https://lore.kernel.org/platform-driver-x86/20231204101548.1458499-15-Shyam-sundar.S-k@amd.com/
> https://lore.kernel.org/platform-driver-x86/20231204101548.1458499-16-Shyam-sundar.S-k@amd.com/
> 
> Where the last 2 patches introduce both the HID changes and the drivers/platform/x86/amd/pmf/...
> consumer of the HID changes in one go.
> 
> I have asked Shyam to split out the HID changes:
> https://lore.kernel.org/platform-driver-x86/ad064333-48a4-4cfa-9428-69e8a7c44667@redhat.com/

[ ... snip ... ]

Thanks a lot to both of you for the background. I have now queued the 3 
HID patches in hid.git#for-6.8/amd-sfh

-- 
Jiri Kosina
SUSE Labs


