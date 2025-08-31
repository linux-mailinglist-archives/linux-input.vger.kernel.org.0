Return-Path: <linux-input+bounces-14404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F97B3D4EE
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 21:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1421188D3F2
	for <lists+linux-input@lfdr.de>; Sun, 31 Aug 2025 19:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA5F275AFF;
	Sun, 31 Aug 2025 19:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6qkGZGy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20773273803
	for <linux-input@vger.kernel.org>; Sun, 31 Aug 2025 19:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756668353; cv=none; b=mOaFNPUUgpVsRmUc9a4pcBvQv0dsLqzRlLE1LKFkOTemPFrrn+yy1wROtEPzzRts10g8yZHU+D+BYaC8+KB7avqKCyk8XMMhpHiHfLMhQ5TvMpSWbHQCw3lb2FOBe9ztrTnkqzrDpa12ITGebppBwBLEyl+YOwrTEEIEtiEwwo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756668353; c=relaxed/simple;
	bh=nTZQ1uiIfsY4BtQ6D/A7TBydRWoGHhMQe+hGXtNdtDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCydQrrp7s1VElXPTT3gmgMgZMVdWTRnSJTi89j8E3+Y76+f/zAHGvMLC69ZL2SlFBXSusiGCNxOQjjFs41JfYJeb0jbCpC2XrcgwppI5V4FOB39DD4yDL8n4cjnvAnEJ3Ti6c3XQ/+WCQFCJNE3H/7B6xIr9uD/5Q3+RYY2Wqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6qkGZGy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3cbb3ff70a0so2240631f8f.2
        for <linux-input@vger.kernel.org>; Sun, 31 Aug 2025 12:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756668349; x=1757273149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTZQ1uiIfsY4BtQ6D/A7TBydRWoGHhMQe+hGXtNdtDc=;
        b=g6qkGZGy979sGqUjYvAzW+gKoVi+GvFM7OkFcvvz/DyPhNIlL/2tyMGkYVIOdTdY9D
         PSArzk0yL17bzEXxWWm7Y5FhsVS/2HtHOalJXlnFhjZqnPE8fAv1DbGn/Y8CAytnh7i6
         8POmmFOFFsNgAnYfP7iagAiwUvFGCkqw/zrC1iB+lpNJerbsGMy22xTohN0ue+8KRWn0
         QSLJUC/8NGiyHbdEmsYWTDSYEkNDZsLjG+wA3j3Vrx9cTI8Vw4YinVJPTZsKsR3sD61f
         xIVSL0nprslwPgDRMCT6qsDCXLFFDW/TO4GXeAZonE7owWryO9WmeTEInL3F6Qis73kf
         Ql/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756668349; x=1757273149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTZQ1uiIfsY4BtQ6D/A7TBydRWoGHhMQe+hGXtNdtDc=;
        b=o93tQDvo0MuG5j0zysYAtGUXsJ0Mx1Znnhr2eC6SnjfCJWRfDFygVP8MXK5Ic/A/Zn
         M98a6zEes7QH766SeRkiclvmltsTG9EUMIw5H6f1wFmbz1cDznSvYveMae7r1H2nSrKx
         w07IXaCZeB5V4//PTtYUVftX5hWFxumaxN5hmM3E+YXEiHxUSYw+XcW46Qv76hJ9/4eZ
         B2UV7KjhCQDYB9NfLqYN/v7ewsufW0xaEdu+6wyk7XmfpOfc3Xi6WIB3p697sKik7Fpo
         rnJanAWtGAAVVCGa7u0qVsVA7HHpK0FuDhf91hJKlN0WupXYqJvHuUHfsRNULWweaQrk
         Ojmg==
X-Forwarded-Encrypted: i=1; AJvYcCV0heuyZx7N4QH4/dUcFEH4/ueGzaZnDpc3plY/y4yehvm90X4uY18wqbpH7JGO8Gijq1RKtXojpUniLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN/tsK+beSrrPURFFJXBXpeE9+nlhq4l9B8psO6ff0mHk0ZzXT
	WRa5Qjwvw9xhn+NNOvmZIiYnMQeFPdk2dTNqIUf/K7e1IJWmgs9cbxBZ
X-Gm-Gg: ASbGnctWFkKiYkQ/PX+4EooNkkHpdcim0K9hBfsJ4otH9NXj4kJJ+hsuF6YqxFQlGJm
	E3REqBhBU7sn4g7KEgATpZb7YX6nR5yd1KJqJqpqLc2CbaSgd0hX1kb43ItnQvNGkapHSsWzvST
	wUDGinGR2s9wNgxH38bod0N2oZwYG0fkLZV3kNwOZNs39NMNed8v3PrFOFP0BpgMmQH28jEpjO7
	+88dx4P4gVd+DRgZialjDJAHKKWAQhtZjv/ANa2C6jW+UHgngbmt602gbdaFJuN/Z8FqrysUlQw
	fIlSCpIscvJm3twaeBr8mC5ibTd4kQsmxBTvW5x9IYPoBWi8GZe9L/5jNoo5RDdPBi5JGejGGdi
	14mBhLvabqZuWt7BHg+TFLCYSy8+kRRHkzUk=
X-Google-Smtp-Source: AGHT+IHuEZaHyLfgTLMTWy0xYTYylZJyYVkdho+fvnI1X6l/E/xXC3osvjzvD/BD9JGoZQ9aJiRbNA==
X-Received: by 2002:a5d:64cd:0:b0:3ce:16d3:7be0 with SMTP id ffacd0b85a97d-3d1d9ac1d70mr3789756f8f.0.1756668349203;
        Sun, 31 Aug 2025 12:25:49 -0700 (PDT)
Received: from snakeroot ([2a05:87c3:2001:7400:a813:80fa:2b5d:a86a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0f85c287fsm10241810f8f.52.2025.08.31.12.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 12:25:48 -0700 (PDT)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: mavchatz@protonmail.com
Cc: benjamin.tissoires@redhat.com,
	hadess@hadess.net,
	jikos@kernel.org,
	lains@riseup.net,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 RESEND] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Date: Sun, 31 Aug 2025 20:24:06 +0100
Message-ID: <20250831192548.433157-1-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20240627224242.193873-1-mavchatz@protonmail.com>
References: <20240627224242.193873-1-mavchatz@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Is there any chance this can be updated for 6.16 / 6.17?
I'd like to test this with my G915 TKL, I came up with almost exactly this solution myself, then found this while troubleshooting it...

Thanks,
Stuart

