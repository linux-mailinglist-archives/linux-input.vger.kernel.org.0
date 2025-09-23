Return-Path: <linux-input+bounces-15021-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D7B97ED6
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 02:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE79B19C04D3
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 00:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6F51C54AA;
	Wed, 24 Sep 2025 00:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="KHCUcNCe"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C81ADFFB
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674645; cv=pass; b=uucUm++p/PWW5ClXGpka9XBtuH6+bqOGwEIbjPg0AdNL+svqDwQGM97cdkXTfb2LbnP2b502hY99iJCV/zkGybnwVx40pVtjaTgDDSS+Sy++9qOSy2BOldLtKlbRRV2S8JPOy1HaYoSR5aqqEIQAqGY4nm8xzru6/wtYCi/V8zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674645; c=relaxed/simple;
	bh=+30oIsOjlBQ4bzPCm5PQEVaYKPjsY+PHEkqDxH7H9QE=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=EYgbPVnLFwvVnXRKpTfF0IQuJapQfdjW1dUEvw5FFVKIatLNom5DUIxbQg6pj5R8N8LgdPAxiybdvG38UPFN4X9EKS+Syr0XQWETRIyy8bhOZVI8MjmTMHpcxqW6VhU09SEUejO5VP9FqdgnCQYcwMwd3v8qhRZ2+ohFLNxTnYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=KHCUcNCe; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674643; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=TGqAUFtkWX/c+a/IFXFVq6IwHBCwvWGJCP1ah0gaidMFOVUn+igVgl9RA9PB4tmVK8WRVP9y7BnuT2U3QfzoBYkxfsO6C98CTHNy1Ob7XXU5u+HN7fQEbO7HF7Ua8A/oLK1CE8s/6M0MZdGTs0t73d37nZCG4Pd74wxdfnpoK6E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674643; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=+30oIsOjlBQ4bzPCm5PQEVaYKPjsY+PHEkqDxH7H9QE=; 
	b=TUxKjm7WfWksD43TypoTtbKtm8s+dqtMRKHYBYqvwFxc22IyLsvuumSG8+TrUJBhO1ouarhWkmCX5Htce876MktNkhLlsmx/ua7GI89UVduE4QAV69JWmkouJW9Ej9McJqlTEUuPnWacXL40m5STu4GB0GtZ9gWLCNQ7Y81sYJ4=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a723821-98d8-11f0-ace3-525400721611_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653186538.3898426177802;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=KHCUcNCeaqCBlTWoCiLLw4j9ddDNUS+Op0w6INhdxeQfzmXJO91CeG7EemVoGJW4Cze4PEo+61Jy25PycTEQi8qEDG6HG8hy18UpJ/qH+h2xoRFceSOq473+iFShnYKtx5VLVNgsNEK8ZvJFxG7i0YLzgivVPJjneqm1+jQhgag=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=+30oIsOjlBQ4bzPCm5PQEVaYKPjsY+PHEkqDxH7H9QE=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-input@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a723821-98d8-11f0-ace3-525400721611.19978ffc4a2@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a723821-98d8-11f0-ace3-525400721611.19978ffc4a2
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a723821-98d8-11f0-ace3-525400721611.19978ffc4a2
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a723821-98d8-11f0-ace3-525400721611.19978ffc4a2
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a723821-98d8-11f0-ace3-525400721611.19978ffc4a2
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a723821-98d8-11f0-ace3-525400721611.19978ffc4a2@zeptomail.com>
X-ZohoMailClient: External

To: linux-input@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

