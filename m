Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A99D645067
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 02:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfFNABi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 20:01:38 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:38924 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfFNABi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 20:01:38 -0400
Received: by mail-vs1-f43.google.com with SMTP id n2so642607vso.6
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2019 17:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essential-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=b/VzHcVhDJTNOAdDRTbow8j/DNogn8ltF7sqkrIq3T8=;
        b=x+tI3AP9uTXM60rkrG+1oiGMyJCF1EScMwISOb5aZIYkHFOrKVChTPO0wTUURMuoIb
         z4a4fsZE1ptwu6NFRceu5CJKew8VYNNZZ5DBAZNVqCYi8gR/obaruPxwLMAclvJoP1Nh
         5pTmtnH59bbRv/bgLfKfD8b6e/b60vaAT86AWN9kuU9dSkfxtSRcVyJb8TKBMPqwnVVC
         yneRklPxOhXeFgnjyAYYMRq4M4C5UYy3ERBvEkbQMOKx10UUAWuNTj/3DfuytffPVFWa
         LkfH6sfelkTclM7qrXz+/7bydcBzdKkFmYd5IYD976AjomF+htCL29D7L//SHmV3NoKZ
         yjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=b/VzHcVhDJTNOAdDRTbow8j/DNogn8ltF7sqkrIq3T8=;
        b=pvKnFH8ibgi+pNPmoaSvvXG3vrHjd39EfnDmaEZL9yIh5h+9YFp5N3tIyiVNM7+Ynj
         qWEnPIMUiKbdNDnckzN3Bl3wmO6xSJ0gfUK+dDRVPK/0iKup6KbpE/Pf1r9qS7AZ/E1R
         3DcqsL0ixwWvmeuiDENXvcgBskIMoHkAfW1oKeYsQSsRyONYjoWOaSmXzgcV7OhIxtxh
         tafCrNXkrbc8DLDhEnwR4+OIga2NFhfb5ajVvul/XjSzr5ttmrNxS6VaZ89uewikICX5
         svJuW3ybefVzFM1grtXzBxu+0WreMGl5OvtVjxtQjE5bExL4Cb62NmKe8iPz6MrYWnmu
         ML/w==
X-Gm-Message-State: APjAAAWowKEdXIY1pARsZQR2VOobiu5dtQCCaN2uNXvXgnzNIo/bldxo
        q85+/Ndq3HZ+30nxlwE3tdJ6gOnMhwPd4aJQQH72/w==
X-Google-Smtp-Source: APXvYqxaGsxboqTVdy2/d1cfs19JKKBAiAcIZ0qmgBQcn7QmsDl18e8V3peuZUQDak5CVBfxM73w/S4w6Nxf01JNbUI=
X-Received: by 2002:a67:1ec1:: with SMTP id e184mr41773724vse.83.1560470496877;
 Thu, 13 Jun 2019 17:01:36 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Jean=2DBaptiste_Th=C3=A9ou?= <jb@essential.com>
Date:   Fri, 14 Jun 2019 09:01:25 +0900
Message-ID: <CAEXycp+Y-x7N_Yr==Xy_CT5K_a1DZYc85w1OUV+cKC5ZN+KB1g@mail.gmail.com>
Subject: Regression post "HID: core: move Usage Page concatenation to Main item"
To:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, nsaenzjulienne@suse.de
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This patch (58e75155009cc800005629955d3482f36a1e0eec) is triggering a
regression with the following descriptor (report not working as
expected)

https://partner-android.googlesource.com/platform/cts/+/refs/heads/q-fs-release/tests/tests/hardware/res/raw/asus_gamepad_register.json

Didn't see anything obviously wrong with this gamepad descriptor, so
not sure what's trigger the regression.

Thanks a lot

Best regards
