Return-Path: <linux-input+bounces-16556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A41AACBA7BB
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 10:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D101300E839
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 09:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48ACD2DF70F;
	Sat, 13 Dec 2025 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIigXs79"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65BF2E0407
	for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618850; cv=none; b=ZfvKvMHTWkjvu4f3C1lYDhbL4et1FErAdLkIDkZTx/rOLIkUjpCeCjwaxW/SX8m/99VSbJfUTAAj3zXRU/jW3I4K7mJ608uSoJcZATvbGR/+I2hmV9IDO5m1fst09nE3jnu0ZE775PNiKi6ySVVtu2bsZ+of4LYzkrQSPf9o2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618850; c=relaxed/simple;
	bh=qEFKXie5vJrx6a5S+nNUgx0Sj0uAo/+iyw1Pq2VAZqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+azSjXMI6rkQFn+xzwmqc9ri2Vvzsb24lr++53sSZxgAmqBRSBneq6gVOvZHtjRjTVY4O2FTDcWSjMSufGTjSVhqAQG2uqmQ9XaG+EB8tI5WECiBuetqkMppHuUhHMB5rnZKUsxJmdLsFyg+i0iamMPyeuaUJ5M8fXAKpcsgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIigXs79; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c213f7690so697911a91.2
        for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 01:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765618848; x=1766223648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GlXqF9nhSvIgkdEsUbMZ/tQ2h8iuKeKknEMLOxVfXsw=;
        b=iIigXs791UFbaMi8+xUoJvgyMDjAu91rP0RjF1V6GNhC3gx8KpAC/u8FHhXrk+UJ7+
         YIr9MPXVWVleWpPvb3rQt5SXGKqg0D/54AHXaiK7TT1G2NtBXXOM3qlzcYkyQ0qsTmcE
         rSZ0vVTAZunhpQJQIrY66ynkt7iqgvoDWPfKUSI67HUFONBC0BMDAPfKejqdjIaj6Zs4
         pdV73XRrke9YVdOopsGtvdVMgpvb55spfcYT5KASxD9QMDwtQRusD41udXWlhPNvx9ri
         4XPjPkpyQKSSc0YExwd4c50hM2t0ix6qw90hg9CnogKWfHOmhEajAS7Cn2FyQxbZByDp
         QaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765618848; x=1766223648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlXqF9nhSvIgkdEsUbMZ/tQ2h8iuKeKknEMLOxVfXsw=;
        b=n+1sIt0ZT8Lt8i7FjQf9RhxzlJENWrnPAAlGqwzLpoIFPgDVjG9ZlXAWOAZb2G18Mm
         CWr3FNtb0UyCH6+OaK+LkEGmaTVqi7SOMbqcDc/7XfuEuWAQBITVCqCUb9X5PzvWcyd7
         +Ohran+P2CCsELPiszcbDQfkHCQKkNbpQA7krlKpGWpodhwuz4IgLcy/oJJ0/GIN6OKy
         xGdSaJrihn/SyQYXM/wzLwHg4q7m5u4SOYomcr7OPXiy8lE84OTT0szIOb9itL4qorQK
         Mxm3278h7stu4g5FgfNsrctti2D9l5WjtBZNEX/XSj8FOtghv3sveYrfhcrpMhwf59CS
         ROig==
X-Forwarded-Encrypted: i=1; AJvYcCUHxtrxA7MOu2AamU4z5T8XApeRiDffgfuUND4dFAgelt2XNf5Sct9/Wm8HPP3pQOqHMuJzDDmhl9prnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz76CCd4nGzeU258zuPiv359WeIvVm3FrucO1jOvNjlrty8P5pX
	DYtp8rRZHYYvZLq+4CHVE9ngEVrdKPl1/qcv7UKlxWwi7TkF0NdEAOW+
X-Gm-Gg: AY/fxX4erjSSka+ZhpNcVXjEePUnABdotDAa2gysItNOqkyX4WoO66bYpES0xbXUKUR
	D4dvrq2nA6L+tFhyYw+a24HRoeYqPtM00sfoHMJpJkkusW/XeefMlmFFf2f4V/zUZVlnooyylf1
	bzPr2xs1GUOE3mPauxhfIyQO9YRppyr4Fih5KhFZIefTGUmdJ2p8TDLSBjKIoXAOPRjuux1Xjx5
	3Rwyf7j/LcLR02xyC6mpCcWiy0nxRiF+j6puF5v5wduisvw+2SWWFhmvdb/Oy0v++dTJMxCUNxp
	UDXExeMBDLRLK0ZRUWop0sWBCYXLzAm7AcQXlUFhjMly22QWj/jbdXOfPbe2c6uxqwsRnC6g+gW
	EweQaxRVgKZVYbl47hS/qVQNJC2ynW0ZNMPJyVbdHWjCKihbcvrLlS4i5XNwEKX2ao5TPtnhFjV
	4kta60jK6YChsBfuveKfzYi3KAb255qTKOAtJ7zlB07hkGTjYepvGa
X-Google-Smtp-Source: AGHT+IE3dHo7tKyXquVMXM8M5LvDb/NQv3IV2NNUcYlrcgrWD7s59hZ5Y0Qv8n3Nsfl4CN4sKLfwbw==
X-Received: by 2002:a05:7022:5f06:b0:11b:9386:a387 with SMTP id a92af1059eb24-11f34c593e7mr3132632c88.42.1765618847882;
        Sat, 13 Dec 2025 01:40:47 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3478:9150:d4be:149f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm23455386c88.8.2025.12.13.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:40:47 -0800 (PST)
Date: Sat, 13 Dec 2025 01:40:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.orga
Subject: Re: [PATCH v1 1/3] Input: cros_ec_keyb: clarify key event error
 message
Message-ID: <53iuqpw5qvdan2s5hegbeqdw6oyk6eygdied5j7gqbatmmdd3u@gpmn23s65rci>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-2-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209154706.529784-2-fabiobaltieri@chromium.org>

On Tue, Dec 09, 2025 at 03:47:04PM +0000, Fabio Baltieri wrote:
> Reword one of the key event error messages to clarify its meaning: it's
> not necessarily an incomplete message, more of a mismatch length.
> Clarify that and log the expected and received length too.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>

Applied, thank you.

-- 
Dmitry

