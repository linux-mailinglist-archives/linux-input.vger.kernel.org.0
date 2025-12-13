Return-Path: <linux-input+bounces-16557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C8CBA7C1
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 10:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47D830424A0
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 09:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EAB2D739F;
	Sat, 13 Dec 2025 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZPpX4qv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E654145A05
	for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765619168; cv=none; b=tw6sdo1GqIpoF+z2RE0jT4/Wui2Danrvc7ZuPQXKkE6G7yNYwvUKRA+eIp0du6fXSWIRfww5v03HYL9u6yj+GSFKIYht6H6/trx7bUCWaW43flmf7hyGB3JFwwxQppt27rNnZe7MbG2ENfqsJgzxLexFU/FoJkrYjbGsuuRFfKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765619168; c=relaxed/simple;
	bh=NSbZQBOFUXaWkcuR/hJOF3n1LVHIwUIhkJnljZs40gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZXOMIhxKTJxDOIEaWnUruWiYEaDvhNa4aT+yklfEDVuoozMqYgNBdoTL/kh+/oe3gnTlhzz7ALRSXBGGb4zRDvPlGpcQwQqo1U8XmVZYqHG0TZobh9BBnN+85tL/83F2lAZNrwHNsVQ/SMyQ77KlEoUC1Ri4fEbDEJt4kcBU/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZPpX4qv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso568219a91.1
        for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 01:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765619166; x=1766223966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=caAzMdu0TkrR2UL5lOMmu+hJ8etOlD/LjX1U1H7Gx84=;
        b=IZPpX4qv4AAqUg26Jb75qjy5DXUAPnQ2iLaAj5VSFhWV/Xvlvc08dEalvzUPB8/1Ha
         aULYIYzXfGaxajGjHl8Ikqg5b7I4uHe5dbhyOuAyfJZSGWbpimt33vwXl+qaMCC+1L9e
         PHymLznkkNB1jm2vzs+5bN5WhiwFJDHwqnpnHfrGBudCFzy6i2LKvNHD4JyxODilnsAl
         HG7fqMJSFPhDPZfUfDz5n06R/Kyib2niwosW7sgRFDjrj453Z7c3cRq4yM9HXqw5n8gf
         JcEBp0AwytYi+6MJJNHO/yIQZE+u0U0ES4+/zcxuNA4YC8AsC4PJbv935Sno+5/M9PUd
         aXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765619167; x=1766223967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caAzMdu0TkrR2UL5lOMmu+hJ8etOlD/LjX1U1H7Gx84=;
        b=mjWLOW/w6WLiDcMva44qCP2FprNZwiHukOI1CtV0D/JZhPQTSn25u0i92WH8dzIDKP
         q/h1RmjYpa0+lQg1Ook+bZ+vDZZSCuTcb0WE3Q6k46tp8Se4KYUtivHuW9EKE5RMwXwn
         uDlwoYXWTu2s3avnGqg9JwYROJNcDTGnYVgMv4SIl+Be6jmxIzalwaeGA4aJ6vA3aLKc
         7bW6OMfaQbt8F/SjgwCGU9PB2+1b6kId6962R1GW58WzBx2G4q659i/NKeG55NupJWa4
         45n9upOXd5ccGGy81xcavyaJ61TBcEY5viw670Is7DcpJvfLZDLjtSgLnhuc4SuPo5q0
         jIfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9h32SzYFGBnh3frPKhkugu5+MsPxhM8K59LOBMoYTdQrbtX6r3AEFZy45t//OaPk5RmMNA7B9nTJYWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJQmDldxIPqBE20jtglwVwDyi6fh8ZgJbf+YxJavP3PGjizcEl
	5Moe142Taj+Hfzn4LcZ48apo36a3vEY2i6zhQS4M1dOpPGDLaT9kCIIe
X-Gm-Gg: AY/fxX6suKIAH21Xa4SCLXibYxVuvZ+p7tX8jyohoUHIm0lz4vPEVKej7em6BGzbsmH
	flXU92QTbeJBGtSwAbz7EdZRVNmQF/7SN0KISstJRjwvuCa/VpPuwCEbySkHHWXV1AJkMbdDtci
	+RgZiW4ouXw7Y05l8m1zHrATrFhJSh1Mmp9ugbn8L4RNV4EW/eaeY0s4e2Wl9asfafcOyEoy8an
	55FU+57/QTOmcZ8xhDa//ic43g+eoxxeqQ2rs1jWW6CFr/KO7jTOJSkZZYrPXHjbigxrF6v9z0j
	F5jFQyY0qyzxXCphCzgQ64UI9rbH/6AU5R74qMhkCCz85lXeMrqWq0rGdLwa2ZAgkHSUzQZky8i
	5+T+QApugjdNvMlvyZVX5jgr7D6kps2eRRieUfCuZYOTJefRuP7C4npoPIGTbSOkVI6O2BZtYDS
	7AtkrRpcThFJ4hlRIWVbu3Ipg018cyDgAhxBC3YL92HjcXAJvbfNls8B/O99SxXSk=
X-Google-Smtp-Source: AGHT+IHEwKVmlUftku9bZpvLbrn8o4ZbzGaitvRNC2Wvc4P/QcAMM+FztDiB812Mo9LIJVcrlS8yDg==
X-Received: by 2002:a05:7022:2209:b0:11b:9386:a3cb with SMTP id a92af1059eb24-11f354f39f9mr2913885c88.44.1765619166468;
        Sat, 13 Dec 2025 01:46:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3478:9150:d4be:149f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30b799sm23915360c88.17.2025.12.13.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:46:05 -0800 (PST)
Date: Sat, 13 Dec 2025 01:46:03 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Job Noorman <job@noorman.info>, Frank Li <Frank.Li@nxp.com>, 
	linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in HIMAX HX83112B
 TOUCHSCREEN SUPPORT
Message-ID: <rfgg3zmapcfkh5krj6kmuvgmcoxmzrzbwlhdslfte4wjzs6svw@yvrgovad3pwh>
References: <20251110054733.441893-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110054733.441893-1-lukas.bulwahn@redhat.com>

On Mon, Nov 10, 2025 at 06:47:33AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit a311c777f298 ("dt-bindings: touchscreen: consolidate simple touch
> controller to trivial-touch.yaml") aggregates a few touchscreen yaml files
> into a common trivial-touch.yaml, but misses to adjust the reference in
> HIMAX HX83112B TOUCHSCREEN SUPPORT, which refers to the removed file
> himax,hx83112b.yaml.
> 
> Make HIMAX HX83112B TOUCHSCREEN SUPPORT refer to trivial-touch.yaml, in
> order to inform the maintainer on changes to the device-tree binding
> relevant to that hardware driver.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Applied, thank you.

-- 
Dmitry

