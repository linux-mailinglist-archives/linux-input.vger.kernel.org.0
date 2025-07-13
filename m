Return-Path: <linux-input+bounces-13504-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33602B031CD
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 17:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EB357A6B04
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 15:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6398315746F;
	Sun, 13 Jul 2025 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ecL2X6z5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC80038FA3
	for <linux-input@vger.kernel.org>; Sun, 13 Jul 2025 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752420979; cv=none; b=qed7qzwGcwXYGMTCNBbfHqC79ex4WsKHRcHCZ4zQeXwjOSMS8pR9RiEVRFPQqKDU1W18Rw7PntytX0jwtNvEPTTAeEAbqCZ15vdxNg/p5ruXT1IOhRj9PkvNuetKGZmCNQKfb9nI71oqIXH3OBMPo3R2U1/EKrpiTtwk20T6qJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752420979; c=relaxed/simple;
	bh=OtLdzkDG9gZHNlIcuLOu7/T9q4f+G0GEG2tcZwLaGnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mauL5AY1x4zDzGPJomsSQkzLZ+MA2XsQFHqsTWgMnjHj1uclh/YVg8wGMbQnx2jZVntNxQp03bTjpEd/uAjZ8lWsv5d4CdjucrPJYTDvw6graMWQqvVAmsJoeK/gbky3C3lHba9JCOA/GpgrAdOhKM7wmrwVNh4d907VZq/nIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ecL2X6z5; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d5df741f71so307883185a.3
        for <linux-input@vger.kernel.org>; Sun, 13 Jul 2025 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752420977; x=1753025777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgiAbctzHGEi6mO8tGBybGTaW34ebEGLyz6arvDweFY=;
        b=ecL2X6z5wxe+/rDwMRsCCOmn7wjtxCYR1e/tKS0h04SvOW/ryZIUi5Ea2Rz/5cTuNE
         csKBItce/kxfR07GgJz14PY1pWe2FSxYgDtiHGVfSefJAAvvYMw3eReMiNgQvORhvqu6
         MCWGDt7RHyYFyl+VtZAfofIy/HocTppqWjJ2hKIwgB1Jakiijf92RQfVGh+aCQiLDmYE
         sq8jgWwhjI4yrZKPlh1bYRqvYL303gvJS1z8cHANZXLgV2AVi8zWyfbAoGRQcmv173B9
         YIIDWhF/oK8jYxVHUzDiiXxZXIbf0E5gqnNIuU0NGDJ5i0Nm05qAgY2xWSGsHZ7U3kCN
         4Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752420977; x=1753025777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgiAbctzHGEi6mO8tGBybGTaW34ebEGLyz6arvDweFY=;
        b=D5akELlSwaR1LOptQzyM0aMb4cFaiXrTJnmuhf7vfjae6/PrMQQBQ4Ld/zivRdroAe
         iAPIuKwVoqxawaMCQiPlhuJUwI90oHKkUSY7jyq9Sr3z8/r64ZB0PUz3PwbYXhMe1izm
         Qf9tovcT6vePPwN3IPnh6LW0h7928pZTIGvTOKof/jiteHTckP+kgNjbKh2gMhej6pFq
         AZSD6XNjZeoLswJuhyepGnOkeWPvpFPlzNaojG64P0vufaZOyBr18nW4Tgmrx2fUsuL2
         YAM1KN4ghQ3S1vhOOV+s3UH8npfwZmcPckQPS9IwnXl0Zu79UB7LFbNbPhQdP58Qokhj
         vegg==
X-Forwarded-Encrypted: i=1; AJvYcCVmyX+YzbIlkv8cuAw/YkzSR+kT45r1gPDg4rqECqcDRvNjYXw9vh0i6GK8tOT3JEAeJ5EKGh3HdJykHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMGEv4sJUDhEoRmMxON7wMK0uGzajYFF5pWKWGctCUkwos3+AA
	H3uhHNqYuW6M+AKeQiTI/3Jig0QbVxHp5OCsFZJSXPn+VG6ooUny0ijpuAu5a5eCgVD30SzdJLt
	S4kg=
X-Gm-Gg: ASbGncuqi8kNKy4hR4wMMWPEXl42P29c2aZQUKeovfE9MNDWodsElMgFMfkp8PHzBkl
	qN7ptc7e0cdxl9thffR7wkkubrz/4IcBbyNrQNjpMgFDSqiu31SeVAfNsM7h4fjVx1LaWdhAJ0Z
	0pt2FJCkLtb4I+CwvgB26xbY7VM3r+ChOIP69kM05nDN/ROHkOVM/LhH00odVKVF0PXnFqbm2cq
	R4hW8I9bT2yGxDQegq/RCumynpDD6Gzm06+zJ/EpxolM6OR/DKcpsRgEmMtJKodWxiZrPO4fqPa
	pYXrnpwJmMLnoaokwCHF4ljUX/LNTI+N7AanEhFTV2q9s6upeuaqg4p+T7h62qyv6v57fHcQreh
	l2KMk8zKVs4zAkU4bgw6k5p4=
X-Google-Smtp-Source: AGHT+IH1wwMnrDCsai/j+oCTo/iwDmbuCxz2g1gw4k1wyFwG11dFtMcHLcsSkStUGinV21npPT2CRg==
X-Received: by 2002:a05:620a:370a:b0:7db:9555:d7ce with SMTP id af79cd13be357-7ddecd13a4emr1728874785a.56.1752420976509;
        Sun, 13 Jul 2025 08:36:16 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e168b4e2d0sm123910485a.90.2025.07.13.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:36:15 -0700 (PDT)
Date: Sun, 13 Jul 2025 11:36:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] HID: core: Improve the kerneldoc for hid_report_len()
Message-ID: <1c8416cb-7347-4a06-b00a-20518069d263@rowland.harvard.edu>
References: <20250710-report-size-null-v2-0-ccf922b7c4e5@kernel.org>
 <175239324234.1701499.15395216375379684975.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175239324234.1701499.15395216375379684975.b4-ty@kernel.org>

The kerneldoc for hid_report_len() needs to be improved.  The
description of the @report argument is ungrammatical, and the
documentation does not explain under what circumstances the report
length will include the byte reserved for the report ID.

Let's fix up the kerneldoc.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 include/linux/hid.h |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Index: usb-devel/include/linux/hid.h
===================================================================
--- usb-devel.orig/include/linux/hid.h
+++ usb-devel/include/linux/hid.h
@@ -1216,7 +1216,11 @@ static inline void hid_hw_wait(struct hi
 /**
  * hid_report_len - calculate the report length
  *
- * @report: the report we want to know the length
+ * @report: the report whose length we want to know
+ *
+ * The length counts the report ID byte, but only if the ID is nonzero
+ * and therefore is included in the report.  Reports whose ID is zero
+ * never include an ID byte.
  */
 static inline u32 hid_report_len(struct hid_report *report)
 {

