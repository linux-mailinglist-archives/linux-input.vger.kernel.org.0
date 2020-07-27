Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F2222ED14
	for <lists+linux-input@lfdr.de>; Mon, 27 Jul 2020 15:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgG0NWR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jul 2020 09:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0NWR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jul 2020 09:22:17 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A1EC061794;
        Mon, 27 Jul 2020 06:22:15 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t6so4257065ljk.9;
        Mon, 27 Jul 2020 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2G6P9Mf8J/hrSEoJOhnZnPBi+0zf3SP1iWdG7utZNS8=;
        b=p4j78vfX/9mLAkK2YSP5Yi9mQ1SehLwx88UvLGkiXfO2Qei+pB48UaUc6JscCJK1Lt
         2QAKnEH7PEnP5VeLoBgWoZTowuVxi2Ccsy4Z9ivgZ4yqzr18DieX2fJX5qBhXtUl0/FA
         DvOWvDo2JiK7ILVAVSGd4wstB5mwxRAIkFJKjhzvqP0PdaJVSsoq6K9Ejp7H+nXBcHy/
         UDGvw3aToxj6uZGAHG9jobc6tMWucM8GtxFygOJXqjZAg223CI6uHhO+iENG7TMWxZZ5
         gKT8PSngLZ64u2gU/NaE7oW1wElf5q+IWH43GVvg+E8DJvq5p3bvhLqdTI9spTFbHEwX
         axsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2G6P9Mf8J/hrSEoJOhnZnPBi+0zf3SP1iWdG7utZNS8=;
        b=SMWqXFGWstsBZwC5j6TKXwf8Xf59gos4ofAdKecZrqgLbN5WQEydnNLfGVosH/nJB9
         mg8hGrefz3VOh7vWONd474PRxvI+iECHPS6J/LdDLmy8YSLjt0WAqBW+ozriYKh1mngd
         gaBx/DTN4D9xMu42ECPCVcxhsv+n4Z6zvhldzOVA2v34kA3ecOxmQRbgrWxHDprR3vjI
         gYNvjji3Ni80aqv9Dn90dcCdDBTTbbyf27LT3CqChcDDgLNKNfPUHLSznL33YXdn5QAz
         JnYXBQOqF7lKbK+wlB7LVafvgDZrDdFmvNtAnUcu/gvLfzEXhBr1vY+TjBYEhvwnv4rD
         AmsA==
X-Gm-Message-State: AOAM532+nw492TPTSuiCY1cOyyHA32xJhom+99qCA+LCV02ETVseMEHe
        hPh3FnfI/dTyWx0bme8nI14=
X-Google-Smtp-Source: ABdhPJwrUr4FBzqkl+/Pvw7UoR0kBZ0rRVSxrqal7gJ0ZThva1s6ANeoZTwRhR7LY1z638OGO5g9UQ==
X-Received: by 2002:a2e:9c59:: with SMTP id t25mr9793527ljj.402.1595856134330;
        Mon, 27 Jul 2020 06:22:14 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-147.NA.cust.bahnhof.se. [98.128.228.147])
        by smtp.gmail.com with ESMTPSA id s9sm501813ljh.46.2020.07.27.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 06:22:13 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmlambea@gmail.com, alexhenrie24@gmail.com,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 0/2] HID: Constify static struct hid_device_id
Date:   Mon, 27 Jul 2020 15:21:58 +0200
Message-Id: <20200727132200.32510-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Constify hid_device_id in two drivers (these were the only drivers that
didn't already have it as const).

Rikard Falkeborn (2):
  HID: cougar: Constify cougar_id_table
  HID: macally: Constify macally_id_table

 drivers/hid/hid-cougar.c  | 2 +-
 drivers/hid/hid-macally.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.27.0

