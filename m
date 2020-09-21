Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2862735FA
	for <lists+linux-input@lfdr.de>; Tue, 22 Sep 2020 00:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgIUWuC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Sep 2020 18:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727447AbgIUWuC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Sep 2020 18:50:02 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A65C061755
        for <linux-input@vger.kernel.org>; Mon, 21 Sep 2020 15:50:02 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id fa1so539468pjb.0
        for <linux-input@vger.kernel.org>; Mon, 21 Sep 2020 15:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qbaiVgf+FPhg9ry/RsD0C9yh5wWMVw6jOEGioOdbWqE=;
        b=Ijp/hNd6/7sAv+e8i4QuvZ1TZcYHmXVOVanj8liTef148wiep/O7NRPU96yjKyZSLB
         s+OMyGdR8Y0DvpnZKJXF7XSNr+IeUWur2TVrV1KVobeLZykqzXQyd4xFMcE4oox3WzP+
         4uK16IDlwG74r0KVWyCgxL2UY6sAs3e9iJao0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qbaiVgf+FPhg9ry/RsD0C9yh5wWMVw6jOEGioOdbWqE=;
        b=TBb6nfy9Qgw7cyN1V+YQNUsifb7o7zb4n8BRHFDc+bGsw6ESq0vZXuuEBfG+V5IxaM
         ElK9k1AiW6IjVLE+jtUae/EQu/6/XTe36lbmWP3PhwDKyIscQvkajrcOBqv7mlHOrCxf
         l23MaHFwsBCxQrLcnbZ1JvmKSc3gV3EV+/XBQG3zg6Lk3UlEPdMFRS/qe5RW83PB737/
         IfyW4zuXeGIUobJTLfkLqkA83IOiNKnFHjgv1/c5l6Sely2W7UAI/EcWh+vTC+M6+DkH
         pOLE8EZDI0TwDMdnjYIXtuiWjo/ubXwN1yMQ66S7Th1oJyqAfOO2rVl2Qp1mUgXJxUsy
         UL3Q==
X-Gm-Message-State: AOAM533IlDfr7APHkcnOjaf8sPF8YE4TqGE9ldxqWZ0zlK5BKjH9ZL1M
        AYX0ArCC2AIDAerRN54cCXfm/Q==
X-Google-Smtp-Source: ABdhPJxqm1yudoETtLwrlF5fTbHh4kr12BmpLuxsZlycuWMBlYrGke/hZarm7COyP8rkKyl6gfhF5A==
X-Received: by 2002:a17:90a:69e3:: with SMTP id s90mr1268771pjj.130.1600728601559;
        Mon, 21 Sep 2020 15:50:01 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:9657:a5ff:feef:7b57])
        by smtp.gmail.com with ESMTPSA id c12sm1581569pfj.164.2020.09.21.15.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 15:50:00 -0700 (PDT)
From:   Sean O'Brien <seobrien@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Sean O'Brien <seobrien@chromium.org>
Subject: Re: ping: [PATCH v3] HID: add vivaldi HID driver
Date:   Mon, 21 Sep 2020 15:49:55 -0700
Message-Id: <20200921224955.2701032-1-seobrien@chromium.org>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200909150254.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
References: <20200909150254.1.I170489c0c2ac1538b3890abb5a92b95ad4f04d01@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Friendly ping.
