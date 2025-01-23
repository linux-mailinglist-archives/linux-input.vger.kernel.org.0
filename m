Return-Path: <linux-input+bounces-9498-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F33DA1A719
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 16:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30C823A58C6
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 15:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20622135BB;
	Thu, 23 Jan 2025 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmASYq1U"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA9212F86;
	Thu, 23 Jan 2025 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646178; cv=none; b=tK7pUfT40LJOfi4PG4U+9LbFDhmXncPu2rGwBUHwn+77bksUiqF6JQTA93Xe/JcZ0Lh9R1UadzxKSEfw83EEqaXhIooVGp1nmsQv+1YoHz38okAbC96bCWnTquWpW8kz+sJI1PczWdaXJyGOeV3RRgyO3SQTllOTgiVvWdFUWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646178; c=relaxed/simple;
	bh=NrD9tohMn9+0XqNxtx5bn8n/sseawkF6bGYnJGkw4Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMkoR/DEOVae/x6thQYlaqxhd8uSxKRdg6QKVZOAM4OnytQz86SgRpfWj0ovlXEpgyyUuu7ZqsT3r3nX6mOm3sf4Yz46lCRaygnWcAtbRvsrIkLzWJW0adLj8wLATK1Iq+UFdxzC4/VgGB31lkVV1HureWwoclrCjHbRTZMXpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmASYq1U; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e4a6b978283so3653006276.0;
        Thu, 23 Jan 2025 07:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737646176; x=1738250976; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NrD9tohMn9+0XqNxtx5bn8n/sseawkF6bGYnJGkw4Qs=;
        b=SmASYq1UH/giSlZtNVwETDcytMHY4w5oLZK0x/2qemPKz5twSX/+or0IPUXbxeNvJB
         1JUIjnRh7wNH7uaCK4ql91ZL2RSbQi6LJgt9nosKfqovUbc71JhazeRylOItyWDL/be9
         Y8sF8lIg3AIKohZOnJEAenE+98fAOB4M9JbWkmsyjPm8kd1SJFaUshBuHfWqOHJ1DelF
         +pUfXTxnFNJg2GMUIjax5Z6284iKKkVGJOv6/TxhcX4vgMkC8Rikgc+eB7nmdraJDHmB
         HOLQ2MX0zAQJMgbApYBXpz3yVi27hnpAKLWZuWprKYPV8EJeakFH+bD+j/XiT4Planhc
         S0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646176; x=1738250976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrD9tohMn9+0XqNxtx5bn8n/sseawkF6bGYnJGkw4Qs=;
        b=HDz+Ir8AqT6563CKnJ0voo9Q3QknbtOvKb+4YVAUY//MpxEkm324hEmDnbrfVo0v5x
         AJmMflPU/GWAj750I0YnZar1ikwJI+MQcSdldEgASEM85cMgrK3phJBt0qH3B9CDn8ky
         JJBuoX8dQzNNLroR8ztwFrzDmp9124XDHGdpnaTlr9nBFfTcn/vvEm62tMeqoZBmeYzs
         zk8yQQArgVFT4iyjbVu2gBbN7hd3wQp6IgwfGZeVI5OE0WU7juy5maRXCeB6djkI8ngc
         mPPy1tWpaEE5EQYufxNRlJRcyPrWGL+SlyBJqxdQFVJLA9Vt2WP/91bgCzTfP9T6ejqK
         yLNw==
X-Forwarded-Encrypted: i=1; AJvYcCUxJ2WLMzgBnT868FJFve/wYLe5XiowAHoTQ+7SJ8tixDJN5eLc5gHMGP0QPkBWFSF/hFUSTpH3SgKVG4Qo@vger.kernel.org, AJvYcCUyehUQGqdIzuQdB7egpnSn6Tt6Sl9zjgZnymXKuchRqSG4UdwazZda0YZwS/GapAJX/efX8/7YxO4QIr0=@vger.kernel.org, AJvYcCW2K9w0XoTbmj4iteHTzlefAY2q5h/esShWkkK62yg88Vk5AXnojQFgbxtfO0NbtPPdLBwLKzaaqLVa@vger.kernel.org
X-Gm-Message-State: AOJu0YwjSvZhmVjx2J0EEy3MTJcwfU0iDqmduGBaugkByexL2aApWtxY
	+2DWpK7799DCdbMAznbke2OAU7GXu2/P6dnrlq8pso2t1C7nE/UDCxk0ocBPTwqrgYj40EhZSTN
	EkMKFtF0b1Jl2xext9DukUdCiR34=
X-Gm-Gg: ASbGncsEweJd5/wi79+tih0S0JfIlYlRtYfu2xEwLAVsLAPLIA0TCKVaowTgnU6x8Dy
	ByNq1QxnEu6UfBeJL2Cu/fuuLNzHrk97RPEabjMpBX/kBbB4FEVoGgL8WwOWJvLM=
X-Google-Smtp-Source: AGHT+IEcgaNEMT/nz9felDBiOOxXNv6kz7jxv8iPIixkQPXeXQj/Qcp8sEMC4T0kInZ7xTeKCClB4Fx7CAupT9sEVhs=
X-Received: by 2002:a05:6902:2a8d:b0:e38:9227:befa with SMTP id
 3f1490d57ef6-e5825780b02mr3125345276.1.1737646176006; Thu, 23 Jan 2025
 07:29:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118-z2-v5-0-6d38b2582169@gmail.com> <20250118-z2-v5-2-6d38b2582169@gmail.com>
 <Z5CNx9natNYmJ5il@google.com>
In-Reply-To: <Z5CNx9natNYmJ5il@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 23 Jan 2025 16:29:25 +0100
X-Gm-Features: AbW1kvYrTQzvZ3DNs13coOwZ-EGWuTfhUMiTchLAOX9rz6NmJ2BSwg_pqYaH0XY
Message-ID: <CAMT+MTQudKdUs5we_UCqN0WPJn+T0pyY+NrbaBFKBM2Rkuacmg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jan 2025 at 07:18, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
> index 4a5ea252961a..a1bd2f3147ab 100644

Since i will be incorporating this into my patch, do you want a co-developed-by?

