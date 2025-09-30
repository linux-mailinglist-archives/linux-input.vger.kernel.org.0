Return-Path: <linux-input+bounces-15173-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C1BABFEA
	for <lists+linux-input@lfdr.de>; Tue, 30 Sep 2025 10:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 355FB1922656
	for <lists+linux-input@lfdr.de>; Tue, 30 Sep 2025 08:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0CE2F39DD;
	Tue, 30 Sep 2025 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bM6ttSNo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0192BE037
	for <linux-input@vger.kernel.org>; Tue, 30 Sep 2025 08:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759220530; cv=none; b=iUWzzNunacKaSRWK63ik5W2kni0vS6UKTjKg6W+OdPaxzbne161m8cF71vKkrpoHElkgXaxn6OscaducqvNZS+qjtS2FskUMNLgCHFKjfM9JN8Qa/1Eyg3Dx/5+GfLnga1cnb78DB+uutfBvX7BINwci7kkoPFu5YCgLY89T6NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759220530; c=relaxed/simple;
	bh=4pE3k2VBU5zrdsB3CR7FkZwhjoZcQukX7hsPH5UvQJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXTu0kH88+zJ+ZISKiR6xGng+GADgDP8FKcxunL7NA8qEx4Zyn5rsnFQWKLcq3TUb5/Zbon/bJ9Js/+OZ8w0/kOUi/kbTq3RqRQRNRByOdT7qFabKYXOMXOQsh9bPDFmFhjDr0DorVfZNJwZrzWY2EgM1FbN2BNjGCrVXk7oH5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bM6ttSNo; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-86278558d6fso289495085a.1
        for <linux-input@vger.kernel.org>; Tue, 30 Sep 2025 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759220528; x=1759825328; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0MYOqdthezk2Y5aWzOzKpk43i1E5SPt8BTiExHKtReY=;
        b=bM6ttSNo7otdGv4BLNxO4zMnBWW2WYdy6KSDTZKB/1BEq3d0PR70G6GJneitZdIHYy
         aCP5mWEkxZb+CuEYPJ1vGlBizeawQQgo8g69L/w5lbsTccSWZ3YbXvgXBrrTDq9Qt16L
         dmYthKXDpPm2+7dSnvZf/vlsNxxJVejrw9GTEZQ+kTuu3eKsEUkKI+kgfMGiswQWJdit
         4GGsIHzJMFTnDD7ZisryVyJTj62d+DanYSpzhtvReMhMQaaHC0Rc5rZb7qY9WKtbDZIR
         t2qhharnKWM2BGVsCAK0RiJzh0eCQkxjEPDP+I+9KX4ZBR48h3So8GbT9ACZz3jBPPxf
         BeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220528; x=1759825328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MYOqdthezk2Y5aWzOzKpk43i1E5SPt8BTiExHKtReY=;
        b=AQMx9yLnMHTpX7lNfWU+HNYUXbA9K4Q1aTYyROvfUXEcYY/ZVdnJ/+l0Ju6sjy0FFP
         2P/CWFcZb5+ORmeAK7P6o37yLF5sD3Zb9Oidf6s3XGex2hCe0ONGafDTvZz8EqMdxu1y
         /qnAHIBwleSYtJ0h4guhdj3f4Zv8/9CMTbToACPTQpeqi876T1sOuVF7QR36jFUT2DPP
         Wtp3mgJzuT6qGUR5eyx9XZ8b7cK2CdXq7yS8Kscaxyk3FpJwd5o+yPDIGIcXBABPchwS
         5aIKdp9WaNrbvSp9tr9vHMGSWbOClHYpGU8hh/Pv7FGbvO4jF2G75UBd1+UnWsuYciFv
         fumA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Nh7sRcoGs9pihRVLecv84sEk93bsSYRD/oYK50jXQ21J9VKUECL1PicUfYMblLJ7HuX5Osr+LNOYHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRPNebixayAxK5/Pu0KD/8RHhv7WjW0B5aV4mKpuvkhRrMNRvr
	105BbCT+RJIe9VxHOmcx7EOHrxzTZ+4bebjg3ve1LG+IhHQYSRkgwt8Q7FIyoJffUrH6+BnVJp7
	op6krjrixkWqruZ4uI/JpgH4c2w5pMRVWKF4TAYVZoA==
X-Gm-Gg: ASbGncvL5o2oIubbSsejdPMoRB+mOMiJ5wRz5BaYzTfCBdnFScTUu8xsc2CLn3XmFhX
	HGMuC37HhIfyUCbssKfjUII/U+Eto0hRBxPzq1ne3qXq6AFxHz8c1+43lQO5gJtK8Z68xIQt9Oh
	MwT4CrZ/OXqzDJ3IwMthvacUmmp+DhMn4ro+FTZNhW477l/2ubxjT9RtVRNYxw2+HuGJ1djwrGZ
	UCkGxf5hTwtrAxMgM7pp6imJjnklNqs
X-Google-Smtp-Source: AGHT+IFFpQTgFBa/WWGnT5QFcu4l0kS7gkEATk8JWkO6XxM3M12kz6g8Ct77aVC/3wWZvw3xXRdgjGXw0bvG4/9kIY0=
X-Received: by 2002:ad4:5cc2:0:b0:81d:6f27:aff9 with SMTP id
 6a1803df08f44-81d6f27b588mr167506256d6.56.1759220528215; Tue, 30 Sep 2025
 01:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821031514.49497-1-yelangyan@huaqin.corp-partner.google.com> <CA++9cvojHApEr0b5ZbRNVjYtWvCS8WmZ-mrGMDh5O9mp1fkT0w@mail.gmail.com>
In-Reply-To: <CA++9cvojHApEr0b5ZbRNVjYtWvCS8WmZ-mrGMDh5O9mp1fkT0w@mail.gmail.com>
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Date: Tue, 30 Sep 2025 16:21:56 +0800
X-Gm-Features: AS18NWBUsQkpqXkip294ozPcJDVep0TBrUZwRk3B4uL8u_5nT6ff_J9AvEre7T4
Message-ID: <CA++9cvrDRU4PStp82M0oz-ZtE-1fuPnMOEfMw4uv3wL1_DoYiQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add tc3408 bindings and timing
To: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org
Cc: dianders@chromium.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Just a gentle ping on this 2-patch series:

  [1/2] https://patchwork.kernel.org/project/linux-input/patch/20250821031514.49497-2-yelangyan@huaqin.corp-partner.google.com/
    Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

  [2/2] https://patchwork.kernel.org/project/linux-input/patch/20250821031514.49497-3-yelangyan@huaqin.corp-partner.google.com/
    Reviewed-by: Douglas Anderson <dianders@chromium.org>

Both patches have been reviewed.
Is there anything else I should do to help get this series landed?

Thanks a lot!

Best regards,
Langyan

