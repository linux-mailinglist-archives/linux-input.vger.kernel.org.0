Return-Path: <linux-input+bounces-15694-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD710C05A31
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 12:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C631E565EA6
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 10:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232B2311C27;
	Fri, 24 Oct 2025 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7yi6jXF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FBF3101C0
	for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302387; cv=none; b=YvOmmLerr0fk/XDSc3ajFCEU+myJKQnWHDosPVLyMTRCn06Y2Y4zu1gNkxlYt159nXruUC5AQCbbH0ank+imxkv1AQccR/N7h7HaYQsLLjARvD2olX2eQEd4i08w6mXXLe+ySNJdytGe8FXcgFqaavdjYR5K14KgTanWFG4Onhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302387; c=relaxed/simple;
	bh=uyiLO+LNkEVTknh5PCD2nlZig9mEvwEHQFhgoM6Efq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L3pBetb9fih5QV1Ykyk67tICvbd3SzAg+RrFNfOW3/LNMTlGcYXZbQA9UNkuSzREQc9NBdlHZ/E0hfSeP/ThWwuXMhA4uxExKWU5i0qCKm0WOtxJTUOnIbRrn+JvvJLe7aBjfyIGcI5hhVeKd4TfkEdek7VVDcyLgQBNbP4Xyuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7yi6jXF; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b550a522a49so1506638a12.2
        for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761302384; x=1761907184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLzt3nHwXvYmUXaWuT5xx9MwPLoAGs/1Oa1T6U/Qgwk=;
        b=Q7yi6jXFphbw4ew7tGhMrHo76Zi5fbGktMvFTMQQEo0qO8HmPZhd+N39g3T60LuXwb
         2oCS4WyJYsG6Sy4oNQfhSiSVRyxyfgiRbsoZ9blRRcYzuqzu+WhzPP6jlzVaNYU07hWa
         n3G0veYa4vschtn220bjCkzfkAxAgAU/j7UeffUBltIm/TjYipDCQNkkFw73fQkCJugD
         I1t0GqlzbXctB+uCvo/6scKrHtVSBvuc1LwjxWsMmO1/8mOzulg5SbJtIiNSRp5nvfen
         pwy20839BsmgTow1VmUP75UpnWB/AVdYBq0r1+eG56FEgZifGW3UV8EiOg0cAO5akYbg
         hYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302384; x=1761907184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLzt3nHwXvYmUXaWuT5xx9MwPLoAGs/1Oa1T6U/Qgwk=;
        b=Di7uubwRoyXAS2rqHofh7+0MmuOdz6T6lXMBQI/qcAfQPCyc29NlZXT4ETEtiJobbC
         N/YjH4uYnDkP+7EPNunRdhIrB/uuI9xIrS0kbj3LOb06h4m9YHiUwu8bMzfWmAmnCazG
         5lfQ4+kQejPw2CwJ9Oq5SNy2FTyhza3852AodHZDy1mvhYEGAYV3pylXU4wV6urfhns+
         OKhRw6af7l1kR68fBWVxSxHNNnAMf69gVagyj8Gz8jkTOw5hVYsQJtIUb6Bf6nA+ZNXR
         a/KmQJARagMfIcNJvLlCsVOjbIfztT40eZwCdICYU5ghrXvPx72jXlvzMH7YmGoJPnv8
         1UcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqBq23bdUfeWiB/8Znvb8LM8Wh/9LAnzXd2Xx1U5LugJwU+VtsOH3fQizxohKLOrYUQGxj7RM8Pmyzmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTNCeOl7fiXcR3pWhpRdUT+2xH/dWduL3NN5ROe3J+0h/T6A0/
	tsdUBfbrv9wx+Dc5Qnae3d1b87tzOXQlITENdSOIAZnsJotGImMK8D40
X-Gm-Gg: ASbGncs02gmQLGik6jV+CAHlOzDa28CtFJBCr3IMaKuW4CZcpOke/PIJqtgKhcO6euo
	HeKLgs5lg+sbYF9rQw0zktpn/jZvWJXEzF+KUI/5dWL8mlXNWrqNP36GUBpS1DInE83U65K7DSF
	SR9HluASvLXlVIEE55SQN9MXtPq+gEfRWXHSzCbGislkPkAAnjAvJCn27uQJHwPVKsiv8ticUsp
	POy2FVUMSsIV4MXaoE+UZ1IvHLNUO8r/Lwt1ueNATQ+XbT+ULARa00l0m2nsSOxGhCPc8yIerIv
	/Jiha3z+HRJZL28qNzkf8ZCrlbh1dauQrCikaDUlJjZEDhM1Lv9gMFmCQ1BAFguVLbAv6S4oagw
	57yBT08Y9YcTLNwEPebVhRtiO9wqemCLMnwGprQ2SlfBFRREUJ6Z7R5PMVcCxwXQNOlQxpnh01E
	BzkBD/jEAuW2E=
X-Google-Smtp-Source: AGHT+IE7bXnfWQJON3TLaojyE2i4thoKnt7jmM3h/3l0Kl0M5gviToItxxqZWN4WOizVmxSBsRm+Gw==
X-Received: by 2002:a17:903:2b06:b0:25c:b543:2da7 with SMTP id d9443c01a7336-290c9c93a96mr323148085ad.9.1761302384388;
        Fri, 24 Oct 2025 03:39:44 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de0fdc1sm51738365ad.48.2025.10.24.03.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:39:43 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 737A64206924; Fri, 24 Oct 2025 17:39:36 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Masaki Ota <masaki.ota@jp.alps.com>,
	George Anthony Vernon <contact@gvernon.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/2] hid-alps docs heading cleanup
Date: Fri, 24 Oct 2025 17:39:32 +0700
Message-ID: <20251024103934.20019-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=457; i=bagasdotme@gmail.com; h=from:subject; bh=uyiLO+LNkEVTknh5PCD2nlZig9mEvwEHQFhgoM6Efq8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBm/ww7t3HvO+itrZPcHkfXXX7POv5J7Ivt/t3dNXtw95 cbLikZCHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZjIh2xGhgmngiZOvbv778Mf qt+c6xktz/Pc7ijtvij5rZxfJeSmLAcjw3xj+Vsf/t/RK96vft34pM2JBH3ug1OZyy742Blr3mf TZAAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are two section headings cleanup patches for Alps HID documentation.
Enjoy!

Bagas Sanjaya (2):
  Documentation: hid-alps: Fix packet format section headings
  Documentation: hid-alps: Format DataByte* subsection headings

 Documentation/hid/hid-alps.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)


base-commit: 828aeac92901c1f31b51ae0b9d792b9af5bd3e27
-- 
An old man doll... just what I always wanted! - Clara


