Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBE79F59F
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 23:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfH0Vyc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 17:54:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36790 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbfH0Vyc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 17:54:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id p13so398517wmh.1
        for <linux-input@vger.kernel.org>; Tue, 27 Aug 2019 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=y3NkCeGo4NreF86pITeiiMh81j7WGpz1PvvFS8AOF8U=;
        b=KvC9Z8gum9rlGZ9lQzakTlZNTxf/uEx7IArSEdQyENNtvbuUSNnKewDb5eV+AJCHGZ
         Y6oIb+oK5LAiv55BAOBNt70jet5gN3S5GbBjOJ0E/itBjlL7K5BlyL/YlL17klRpxcwd
         tY5iFUvfc7zqxDlqhr5+nariUOqnsbZJNabBDj/tHCnK0gzPuxa47SZo5yVUcmB2fYOj
         g6GRL6osI8PvpXyykSub+rsC3vRgxwqpz4mHL3kecvwi/XOp3lqQ/hCOpI0uHGA7PktX
         Qi8FMRZeHD4LQPUTv1h55FHcRHfUwzo5SuRiAU14xnCp8zrbMgYvNphQLms934gOp0Vl
         BI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=y3NkCeGo4NreF86pITeiiMh81j7WGpz1PvvFS8AOF8U=;
        b=sNiVPG5NEj4OQta5A2SUtydwDWjLfxdO6qHN5yPJlBKu9uxN0lZoo+GNF8a938CDrs
         vqI93uDIPVHLJOvSV5hHkqw3bFnS4u/c39LuscdFwW2WzM2ZBPguqOpc5/vtaX3pozbg
         oBGttyidocUSlXQI9TlgHIcP2ZAc5oqYiF3IfcN37z0q1cugNJm1mi8FJTx2Wz0jnEXB
         ZLei6tJGvvwbMK+zYgeMdb0bLTpL7LfRBSVj6Qw1MKEM+SYEDQo4cyIJ4wU/Bwvulwi2
         gi+hJmcki9taDhjTgtx4wJhjUmkMX5SWJxDxKH0TgWOBSshvRLN6mi+td5eMAnrPYzpf
         Nl8g==
X-Gm-Message-State: APjAAAX9fZ1nv0Vrl2/UPNXQru2RFbbzfRvMf6yMXEpjaR7QnMa53bQt
        SuydzrwHfp5/Dd1THO7wxUkYRDmj8O2bim61PqNNAElq0Z4=
X-Google-Smtp-Source: APXvYqw2svpeQwMrf2y5AmAa8iKF5Tm/EthrDn7hu+UvWxybcUiBTMqCKjvEBi+X45egesYf2Wz1bwX4HKPxHGpABJ8=
X-Received: by 2002:a1c:9a46:: with SMTP id c67mr667092wme.152.1566942870072;
 Tue, 27 Aug 2019 14:54:30 -0700 (PDT)
MIME-Version: 1.0
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 27 Aug 2019 14:54:17 -0700
Message-ID: <CALAqxLWRV2A3cGUgKfX2j1RPruESTqhG+stXCfrFTL8XaM4UWQ@mail.gmail.com>
Subject: Possibly -next regression from "Input: allow drivers specify
 timestamp for input events"
To:     Atif Niyaz <atifniyaz@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Alistair Delva <adelva@google.com>,
        Tom Gall <tom.gall@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey Atif,
  I was testing today's -next with AOSP on the HiKey board and was
seeing some odd mouse behavior and I've bisected the issue down to
commit 3b51c44bd693 ("Input: allow drivers specify timestamp for input
events").

In the logcat log I'd see a number of:
 I InputDispatcher: Dropped event because it is stale.

Usually it would seem like flings weren't really responding right, and
then the UI would basically freeze for awhile (even though the mouse
cursor could still move around, the UI was just ignoring new input).

Just skimming the patch, It seems like maybe we're hitting:

if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], invalid_timestamp))

check and the device timestamp (at least occasionally) isn't
zero/"invalid" but also isn't actually correct.

If I comment out that check, and always call input_set_timestamp(dev,
ktime_get()), the issue seems to go away.

Do you have any suggestions for me to try?

thanks
-john
