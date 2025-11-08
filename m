Return-Path: <linux-input+bounces-15951-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7454DC434AE
	for <lists+linux-input@lfdr.de>; Sat, 08 Nov 2025 21:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A123188C785
	for <lists+linux-input@lfdr.de>; Sat,  8 Nov 2025 20:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AA1225788;
	Sat,  8 Nov 2025 20:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Q1Kpnx4V"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBADB1891AB
	for <linux-input@vger.kernel.org>; Sat,  8 Nov 2025 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762634891; cv=none; b=ORhfyHV+PBxESf5kKzTfl1LuiOBp7X3XdpH5V9hLW9uFMs/RMsOYhknQ/vIoJX258lXPd4qP18uzpfaWHzLqwujkfbdCNKHOk9c69UNoYLzZ/VSVFcRkqA6StGl6QmPILHzlGLmJ0HNxBLpLOUm4Fh4Rx/jVOVWeiKNfkh2yKIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762634891; c=relaxed/simple;
	bh=QlR0B6N9BjTErbq8JWiIdrooqruUIOIdvGtkH+2nQNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7ozHIoQUvSsL0aXMsTVtT6JeylmRKc84Hw2QDgaPqoOxPuDri5+AMSnXynWQbMYz3PYvaYS5hn/fEO0bRXFLMHbQ9zxBbjpEX+avDOmhWfjcL3CF5uZfP9B6d5o9r1nZ/XvP9DDL0h0kqQYtowWCU1HVhXTbkLpLacw0+QgwxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Q1Kpnx4V; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-87c13813464so23431066d6.1
        for <linux-input@vger.kernel.org>; Sat, 08 Nov 2025 12:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762634886; x=1763239686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qCYrdx1jDzo1jgoNSrvx+iisAmac061wFNMLeHZf7TI=;
        b=Q1Kpnx4VGdjK9/YN5UfIjNFboQYMCdgOLeXkwOz96HcKt7SqUMgvNrcQ8HvHdxDZqE
         rOSFPNI31h9BkiJDf7VRHTfK1fUJ5DLXDXU+X3fTgfUG9xYqc74tiY9/zEhR63OFDfaA
         lq97RYl/OK+PFWomTA87VE6jqLRw6F7W4KqQuKtaCBLDg+xFLDUO7wtNeBAHf1T78lnL
         dl0UFCxV3/764OJJFBocmEvYoXznFaaePpTixwST9CuODsnCXwUjL+UKnsHxp8GccBx/
         WuTWu4j5Vla+PsPKK7asvwgRzTgQaHj3mQCiL2k+5129ZypRC6YEfdVEgTraqyJEGVuO
         xdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762634886; x=1763239686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCYrdx1jDzo1jgoNSrvx+iisAmac061wFNMLeHZf7TI=;
        b=rcec17nGqExmmetEeCJ8Tg88D4hMuf7/aQyppzGdFot6dRBQpHMdln69tmUikamIhC
         KG1SFgT6oygEd+MO0zgihgp+wA4HmyNXb2heDC5uPCiB5x+Ye873SLVagpusQlmMkCmK
         IoC2+xryWgpmmFTiWEVpz8A940fC25JntISb5Wgl+58Rd5WDNulsYlv7k8ihvfSAKPQK
         yTzYpy5XOQPelDW9XjF54kiXx/m5bLSSeHby3EaZ199JrRd71UeqHv2cgJsuXgS7BJcH
         blmQJ8XWG4/I5jYokB5U6ehD3GulNcCuyru37EkYmbmeggo6+hXnlcEYQWr520o/Eylj
         UhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJZAipLQVDmi81H20lEtOvrq3zH72V+Ye2mgLoT2dbY59vPXk+0OWgMaPBjdJ0UGn8UZD7XkD4x2xNsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNy6dPXb5ZN6sRRpI5JlDZAOvDKqaGRCMjbmZg4paJfzwOqjw
	qKCLBK0wHaqpORSAWgUXz7vdj3jlhRc1mp1rJcENE+1Uhx0rCnRQHlVkiCTrjCyWfg==
X-Gm-Gg: ASbGncunonFy+eGOIFRniH3ZQN3cvrrZNFMcQTGTBciquESXuIF3d0eTs5lu7crQsHm
	EzKh4/3zPjTtVm9llEpVHqwE6WBNUUPHFFvQ+O3+2WF4eFs/j9S1GghjRrYJqjvAnVHvumOVEvf
	6hyqA9WYvwlMfMYo+rfvgxqu2b7g5bkQ5khevMXlKA9Za6ajlxJf0HVS1u2N/lT2wk6zGD7ppd4
	ULsC/zV963Boi7+nq0qcw4254/Sj7xiajJ1/uuHB8nMsFwRdCK/ods2tVfh7++pNxVKLFeE/k6G
	Ser8CytMOb3D79HZ+vx9P4VpUJfRJKhdlBM8JJykfMmMLtoE/EvZrVaotxWZBbRHm9tEV0Q5VK8
	5/4zXJcMTlvhHX4a8EswHfARLb6PVLKCBRqBUAhIzn4q7YuyVttlOP5uZ1e7X6WjPE6fpxxVQfm
	WLvA==
X-Google-Smtp-Source: AGHT+IGVJnBaKHGM31qZ2OMIKVy7/r7gI8SWt96oc87GL1Lm6WBvCGhhnKi5OFoKYu+BZ/8J0Pu/vw==
X-Received: by 2002:ad4:5ded:0:b0:880:4ec0:417f with SMTP id 6a1803df08f44-882386120e3mr46827916d6.24.1762634885616;
        Sat, 08 Nov 2025 12:48:05 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda563fbfcsm17586141cf.10.2025.11.08.12.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 12:48:04 -0800 (PST)
Date: Sat, 8 Nov 2025 15:48:00 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: The-Luga <lugathe2@gmail.com>
Cc: Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
References: <CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com>
 <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>

On Sat, Nov 08, 2025 at 03:18:03PM -0300, The-Luga wrote:
> What I am doing in order:
> 
> 1. The speaker is physically disconnected.
> 2. I connect it to the USB port.
> 3. I will use the knob to change the brightness.
> 4. The speaker reboots.
> 5. I will change the knob again.
> 6. Wait for the system to come back after reboot.
> 7. Stop logging.
> 
> ```
> > sudo modprobe usbmon
> > sudo cat /sys/kernel/debug/usb/usbmon/3u > qr30.log
> ```
> 
> 
> A little off-topic but... Even though it's safe, the cable used to
> connect to it is USB-A to USB-A. Every time I look at it, I'm
> horrified. However, they also work with a USB-A to USB-C cable (where
> A is for the device and C is for my computer). They have a program to
> adjust the RGB Light, Equalizer and Volume not using the standard but
> something they invented (No hardware volume, then). It works with a
> pass-through to windows VM (reset does not happen on pass-through).

Have you collected a usbmon trace showing what the pass-through does
when you adjust the settings?  The differences between that and the
usbmon trace you collected before should be illuminating.

Alan Stern

