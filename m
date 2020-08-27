Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5BF5253B98
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 03:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgH0Bvt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 21:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgH0Bvs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 21:51:48 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF35BC061350
        for <linux-input@vger.kernel.org>; Wed, 26 Aug 2020 18:51:48 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id t9so2228883pfq.8
        for <linux-input@vger.kernel.org>; Wed, 26 Aug 2020 18:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9swG66qCWtjd/cAQzBWYeWwUWndI+SaVUBb1QqNeqWc=;
        b=mniQknkm/yzJo0JXwxc2uTfNGFN7ICDsheIu5LZAWGh8WAsMAAYTLgF1WaNrryJTJs
         o2VBNpdwMIa7Zj8CzN3sOfjIdISa5G5W//OrWpb39SXqwW3Qdvp8fll5fxtPQM7wJT/v
         sseE0SsLTvcd8O7dBT2GIMC8XM2BKAaDp9ILo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9swG66qCWtjd/cAQzBWYeWwUWndI+SaVUBb1QqNeqWc=;
        b=XOUV1AW5HF9jM5FOyLrSO6l2z3aB6kpHxzQXiapM+a5hBXqfB5luXkXsRhM6qE9eFn
         cmHJ82Yl/++Kr97GTxSfj/yebTrR0WMu14dkR7ONTvgb7o5vbHeVftM9BZE6w/s2+u5L
         Ua4NCmen/Sf/qNi9PJv5tkrIfUDaas0r+KesUmb1phrkj8Lfx09DoxsjWH+cpHOPDt2r
         e/nrbYs/fcBVIk9EHPu6AbTmueq5BAWA1R1PtxJfsEbspPBT8TbKURGWdNpXLrkQqriU
         sRtDVcVcAinyWy+ornD0sLd8usglD6smiHEZS0/auBKpgISrht1wKPLVAmhB45rblng8
         MHuQ==
X-Gm-Message-State: AOAM5308H3/z1VvqVEWiOvf+5Q199dKzn4udEYNRa3bZKTA4O4HvQHv+
        8UaIzTWwC4G1sluPDWpsjYuttw==
X-Google-Smtp-Source: ABdhPJz/O2B9PnI5PMvHOTbTvsE8RPqNZYxPJBMYmMkzw352ixW1jRwfvARKXhh0cr5G1nPDTZqF9A==
X-Received: by 2002:a62:2ac1:: with SMTP id q184mr14265959pfq.160.1598493108203;
        Wed, 26 Aug 2020 18:51:48 -0700 (PDT)
Received: from localhost ([100.99.132.24])
        by smtp.gmail.com with ESMTPSA id e18sm288283pgr.53.2020.08.26.18.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 18:51:47 -0700 (PDT)
From:   Sean O'Brien <seobrien@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Wei-Ning Huang <wnhuang@google.com>,
        Sean O'Brien <seobrien@chromium.org>
Subject: Re: [PATCH v2] HID: google: add google vivaldi HID driver
Date:   Wed, 26 Aug 2020 18:51:43 -0700
Message-Id: <20200827015143.57364-1-seobrien@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <nycvar.YFH.7.76.2008261311550.27422@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2008261311550.27422@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> I actually believe we should follow the standard convention here, and have
> just one hid-<vendor> driver for all google products. Currently we have
> hid-google-hammer, and this would add hid-google-vivaldi. Would you (or
> Wei-Ning, CCing here) object on merging these two together?

I'm a bit reluctant to merge them.  Partly because I'm not familiar with
the hid-google-hammer driver, but mostly because this driver is intended
to handle non-google products which will use a google-defined usage code.
Perhaps I should drop "google" from the driver name?

Thanks,
Sean O'Brien
