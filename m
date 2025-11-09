Return-Path: <linux-input+bounces-15955-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E47DC437DE
	for <lists+linux-input@lfdr.de>; Sun, 09 Nov 2025 04:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D1C2188CD0E
	for <lists+linux-input@lfdr.de>; Sun,  9 Nov 2025 03:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E3C1FE44A;
	Sun,  9 Nov 2025 03:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Qtsnr0Fg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2151FA15E
	for <linux-input@vger.kernel.org>; Sun,  9 Nov 2025 03:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762658552; cv=none; b=Vev84y+BohuGIekH1NhCl7t1nHE/MKZ4ecejl9WFIK9W3E4Yd7dlHSKQgofAWkvg4nxHMW2PKUF+1Qz6qhS32oLpaic+cnhhBSVnY0pWLi+3UR4BYA57h4Fq7zGxJoiD4X3EV560/hnp6CJrz0ZGsYcTXl5gBwa7fwS/IBkAmH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762658552; c=relaxed/simple;
	bh=3EmPAJIBkghi884jANYlC0hB0hcjLSSglw3VMgChI3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBYBDZs74l1odwKy/m66MMp7HWDZahjXdEjQrMWyhACpt8Ilg8UCAQu4uVyaHkXODjaHEzN32zMkg1UQGzRYkpN6fevwQosF6QwpCG4+jaTVSl1uCSGvEMQPEtDBkfu57eKwVxZv9YffzFi9vmnhJib7KMrZnVIbMtEXIDQh0Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Qtsnr0Fg; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b1bfd4b3deso174427885a.2
        for <linux-input@vger.kernel.org>; Sat, 08 Nov 2025 19:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762658549; x=1763263349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8cLuHhaL3JL1JYJOqeWR2ULSMS5K0VBLMyJHCPLGsTk=;
        b=Qtsnr0Fg7pauw61be2foa5s+/Ae9hA6vJ7dXpnnnLRani8n3SAoRR4eiLLSLO98iPk
         s/P07nxUZo/PRY9Hj5iylVhlsaZC6SBweomx+3aiwcu8X0SJce2rAI6pPWMXAmNHOxEh
         oUOnuAdM+5jfuDc14DkDKVcLgbttUxnEXyx/7Iey9ka8lov/zZLKvqkuLrLjLHcowlyG
         eZbfqPuZFG8ssZZC9kJau27MAfOh0KVc8r9jebG+l3D2KGFd8cSPzZWCAQwf4UeAnZMh
         XaNsaaJ4fH2zT0GsJzkMPny1sUk9YT4nvoWOw4M1W6SK7iwvxgds0WUjnm4CbFruW4xe
         uIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762658549; x=1763263349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cLuHhaL3JL1JYJOqeWR2ULSMS5K0VBLMyJHCPLGsTk=;
        b=neDc9okVE/NmoG7IAT02OeahEFpFATiHGpmKgy1bOfqXB7FQuXniM5dYsa6uFTTfm8
         8Kpwe1IvMOlN9gkAhSDto8YOVWKSJAQWuIq5DjxnN/DWUIRsJOParQEo0Omr0YqZIsrW
         YbS9FB6/VzrTjMT+UFkyxtauwxhUTlo34sRjnYA170GwIz4ROEQNyVeJY1VC4Us8ceXB
         GsTH0muof3Q8Ef06sNzcIbCpU0XoVZiQ0cCxYnyLs5PIHPndR1qxRWbZt3YfyOyRDXxM
         cYzY/Ez+veSACGp9YFhQfi2DPcsjtXwJK/BBQIZKB3itPnjoglN2mC/Ls2RdaaV+Sv41
         B9yA==
X-Forwarded-Encrypted: i=1; AJvYcCUQNnCkgDWq0MH9JgJmeGIJ6AeHDBB9q4Kc3iqKUfIArX5y47bR2ArlynQGlcZpV71Ayxia1H/rG5q0og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZZggUQi8M76KP6yAffetCmx4UnyaAtclvPYNrcPSLA++2YKbo
	CPrU7S52Bz8KtnTkn2tEwcTO4sRjWn1JBZLjfhRAhR5UEFoGd2+cR0spaBV537F02g==
X-Gm-Gg: ASbGncu/QbcQ8X7msKvMg70kXxiT0ULD13iaUvE2pyhcoGXkXl//OJgfsrt1THbPfrD
	Lv9+bkyYP93XMDBgRpnSMKjDj/zvQt2T8MBxFqHLayOorZQKUrDaTY9YDR/ZwGEB9kRqPGbZmyu
	2gUgiPZNaJMzv3NgBPmYeKnPSJ77wwtmyuhM4yk048urn4UBTaMCzXlixQdqouVpRaJn9oVKyXz
	/ZwM06dSYmo2vAYVxNZDqHNGK7yDMXDyG7knkq0NhCxfSOraeCef+wza8JeYaQmE5T7YulG+iGU
	jCnUqCc54JHVs/xIPLo6H9yZ1YQ2cD+ckYnA49/lJrFF+x92IzRkx0vV63Mo2s0iapnNeGChJ4g
	PSpVUg7S+wUpk2CDlKSz++kqBKPSpEnRW+ZGIIm3JuCweZQG081qYsZEDRx8bS7BLMT3eMiUjFC
	JNwQ==
X-Google-Smtp-Source: AGHT+IESs62WjYcVuQErurtuWMXrzAAH5ZJ5bpp8mg4PvP8T39E7vELINu/vugLftIyiCFp5DvXkTA==
X-Received: by 2002:a05:620a:4404:b0:8a4:107a:6770 with SMTP id af79cd13be357-8b257f6a9dfmr513959585a.69.1762658549357;
        Sat, 08 Nov 2025 19:22:29 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b23561a6d3sm741109585a.26.2025.11.08.19.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 19:22:28 -0800 (PST)
Date: Sat, 8 Nov 2025 22:22:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
References: <CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com>
 <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
 <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
 <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>

On Sat, Nov 08, 2025 at 09:15:07PM -0300, The-Luga wrote:
> Here are the steps I followed to gather this data:
> 
> 1. I ran my VM, with the speaker on the host.
> 2. I ran USBPcap on the guest.
> 3. I ran usbmon on the host.
> 4. I passed the speaker through to the guest.
> 5. I increased the brightness by 3 levels.
> 6. I decreased the brightness by 3 levels.
> 7. The speaker did not reboot.
> 8. I stopped the USBPcap and usbmon logs.
> 
> Next, with the QR30 already connected to the guest, I ran USBPcap
> again and adjusted the brightness up 3 times and down 3 times.

While I see a bunch of interrupt transfers sending HID data from the 
speaker to the computer, I don't see anything in any of the three 
capture files indicating that the computer is telling the speaker to 
change its brightness.

> I hope this helps.

I'm not sure that it does.  What would really help would be to have logs 
containing absolutely nothing but the computer telling the speaker to 
change its brightness (and the resulting disconnection and reconnection 
of the speaker, if they occur).

For example, to see what happens when you try to change the brightness
under Linux, do this:

	Plug the speaker into the computer.

	Try to make sure, as far as you can, that no program
	is sending audio output to the speaker.

	Start usbmon.

	Change the brightness, just one level, and wait for the
	speaker to disconnect & reconnect.  (If this requires running
	a program to control the speaker, start it up _before_ starting
	usbmon.)

	Stop usbmon.

For a similar experiment using the Windows driver, do this:

	Plug the speaker into the computer.

	Start up the guest OS and pass the speaker through to it.

	Try to make sure, as far as you can, that no program on either
	the host or the guest is sending audio output to the speaker.

	Start USBPcap on the guest (and usbmon on the host, if you 
	want).

	Change the brightness, just one level.  (Again, if this requires
	a program to control the speaker, start the program before 
	starting the packet capture.)

	Stop USBPcap (and usbmon).

Alan Stern

