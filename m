Return-Path: <linux-input+bounces-13319-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 396D7AF02ED
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 20:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 739B31648E9
	for <lists+linux-input@lfdr.de>; Tue,  1 Jul 2025 18:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99477277C87;
	Tue,  1 Jul 2025 18:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQ4MCHaW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E414826B2AA;
	Tue,  1 Jul 2025 18:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751395385; cv=none; b=b0lo6VAYXrRUvLGPrLk1Qq4R6eJbN9PYMc9ZlAGwJsXEiUFMqJQTc+B9ZfK0CwNL+Gmu8QXdhBpeDanPJMPZd8Fv4S95QOMETUHB3cXfkbocN9iDpmX36gcupsyg5obwpNgJ/fDksP2jLhbvn4r6Zh6MgFTa+tNuDE9pbU5cCDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751395385; c=relaxed/simple;
	bh=TLD1eH7QG1RMQ5kQ0JOBr7kEZanLizMzfIK9P2sdH6I=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnilJF4BC21YBbx3vzsSFQNhlI4ztBes6hSCROpYsHFuTRZInbcGo3j9asPUL2ySuxcHW1SCjqcJDGMyxDKUA8rWiUGjanqd4SRSjM/69MyzjWvNBkZDEcHIitiZgWNQtvDodfrTnhF+h6Xv1XfUXd89+NYlUay3Q166psVo0mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQ4MCHaW; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313cde344d4so3805312a91.0;
        Tue, 01 Jul 2025 11:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751395383; x=1752000183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I+SG6Tt4KHkrRjqEkVn7kMs9ojU5m0MDgknevDRQel4=;
        b=kQ4MCHaWQjbLN5AjeUvzqJbQAYbZ/5I/Ts9ecooZ5cLHZCOVdinwCGQK4rJSlUObEX
         7xgU/wiq9AvSU3fMagFa4BBRdjRUOcnhYnRGmPAoSclnudxwtWq0ihw6lTNmB+XyVDwh
         hokowRm2UkrypUWKS963W5aIUdb06fhu7Kb1rK0anuIM8xjxvWp6waC10si2avLGVxBf
         W3ikBug+gZNzaafrpR2zctB7i56VpYQLz3unGnW4ts5LLLkWSJgDz6VUmXa2fT/AB48e
         F+dvjZhj89A8BPW2yztM0pBGGh7Uf/tObNjoC6SllZe8WAcW/j0rKcO1Q7beZ21OUM/S
         3CbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751395383; x=1752000183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+SG6Tt4KHkrRjqEkVn7kMs9ojU5m0MDgknevDRQel4=;
        b=AN/x82lk8mbZz1BbXVtIBcbNjB+v/JU+1vCM4Axw/KO8Elk1cS2UY3VnPpvttZeUYl
         sySX6an2XhTNKnVYqY39rgVfpXDyei/tr+63QFMgUllPs7WSsxMGABVbKQ6DC5V3l80r
         qWBYYSX++4UAN5CQrbvr2LGJn6NjeYlIgXpC69BLo1e7EDCz21agYTJpilCcW4W4pj6D
         lH1iUNoLclfNFDRY57FcPXryXfZ0XpKUgaKvwJgpqDK4ar2TX0yHCEVm5S2bThipaXu9
         DRrbmTdS2UYF7Z0Db+8DirnBqluA+ap4DGP46cGNkcanN2QjKaCzxiekM7N/V9dvZknZ
         ZWfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUamlHiupAEbFGZVKxltW0qSBaRdXjt/Oqhw7dFe+SE0kUFkArhKCuT1lW75m0lAA6kPFsHjHXkeXK3cqM=@vger.kernel.org, AJvYcCUwTR+6Dw6WPXw/WdaRnxyOhGo5JYPX42zU1UAd96yWoY9gqU/LAKYGAdTToIZ2xMNa9ovHUtBRhjw=@vger.kernel.org, AJvYcCXMQScNgZavq0xlEHGjyNC8rNRHnp/IHl9qLbWjlFrTIh3cyQA7CPh5fRRREBQuPQ+iO+8aqJuQsB0AqRgNKth9w5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YytMXSd7PWLBajsMW6Hhx5gOSGE4ePbYuzTWfxDGd7RFKyETHiF
	XT3GYnchFu+1LMS/X725ylR8UrxNbVt/2bLp5crz00f5VTQ5mwXhQ+wy
X-Gm-Gg: ASbGncvs2+1m/B4CTOFM5h1jq14dERCVyZAUAs6IoqJ3KPPZCcIWPYLrD2zwsqcbG1F
	RpI/2CqHKJcUfXYph3Z78S3hbSQwmKjBvbxJkuEsbhNcdk6/sGn9LRC9ABoNz4a5Phf52sVv73Q
	t6t9Soe/SMpol8hniiSibxWyLCHYw0TZt+CBteQeou8I+UT7lHswptjPIR+GrDNGH5o+OjVsGfZ
	eEgxQ8ukkelfAQZTnYxnvwFuJR160cXE1pNJjIbSNx0bnnJ9os2s5eOeVnOmKZuh6Xq3PzDEjS8
	48tljVZynUjBmtiGCCPpK7q6K+Qv9MtqrTAYWM1fYD0cCCyX2A3AvIi+vAtrXaC/0kVVRNhoYA=
	=
X-Google-Smtp-Source: AGHT+IFvtbnp6FhcoQ98EDCZdZNMAi56XJouX52/GQBNTIx5B5gGfnQI1MCW0/ZXRTLIFf+KyZ+1ow==
X-Received: by 2002:a17:90b:58c7:b0:311:eb85:96ea with SMTP id 98e67ed59e1d1-31a90b368c9mr151699a91.9.1751395383134;
        Tue, 01 Jul 2025 11:43:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7bb0:b5bc:35bb:1cb4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152d68fsm11833671a91.49.2025.07.01.11.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:43:02 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:43:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH] Input: edt-ft5x06 - use per-client debugfs directory
Message-ID: <2rj2nsykojzfqandqz4q5hyuvgyqb25yjouddfv7gyoci45qml@dgveljxxia25>
References: <20250318091904.22468-1-wsa+renesas@sang-engineering.com>
 <6rid4lbtyisgchnl4grnwzysrbw2wtd4lrkjmw5tcs4xyggafo@tondbi5jhl5w>
 <aBMLQLv2cm1RXgTq@shikoro>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBMLQLv2cm1RXgTq@shikoro>

On Thu, May 01, 2025 at 07:48:48AM +0200, Wolfram Sang wrote:
> On Wed, Apr 30, 2025 at 08:13:08PM -0700, Dmitry Torokhov wrote:
> > Hi Wolfram,
> > 
> > On Tue, Mar 18, 2025 at 10:17:41AM +0100, Wolfram Sang wrote:
> > > The I2C core now provides a debugfs entry for each client. Let this
> > > driver use it instead of the custom directory in debugfs root. Further
> > > improvements by this change: support of multiple instances.
> > > 
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > > 
> > > Build tested only, by me and buildbots. Trying to cleanup the debugfs a
> > > little. But not sure if this is too complicated for users. Opinions?
> > 
> > This looks nice and nobody is yelling. Any reason why I shouldn't simply
> > apply it?
> 
> Not really. I marked this as RFC because the path changed from
> 
> /sys/kernel/debug/edt_ft5x06
> 
> to
> 
> /sys/kernel/debug/i2c/<i2c-bus>/<i2c-device>/
> 
> so people have to deal with bus and device numbers now. I usually think
> debugfs is mostly for developers, so they can handle that. I wasn't so
> sure with this driver for some reason...

Sorry for the delay. Nobody raised any objections so I applied this.

Thanks.

-- 
Dmitry

