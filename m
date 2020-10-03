Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2949282155
	for <lists+linux-input@lfdr.de>; Sat,  3 Oct 2020 06:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgJCEuI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Oct 2020 00:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgJCEuI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Oct 2020 00:50:08 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197E1C0613D0;
        Fri,  2 Oct 2020 21:50:07 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a17so1653225pju.1;
        Fri, 02 Oct 2020 21:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=t+PhgsvGg4+eGtz8ppoYHcz9iOGtIlfGmF8+vfAfWhk=;
        b=LmViDQ7k96u7nnq88vyleok9WPVdzIcLou+cT7jiZy7B9QtN9DkFOCnGYudULe9DDe
         BYhacgfAj2a5/Yq7boNTEAhBGgbx8T9bMhmb/RY9AJFtfdib4WxwYHoAm4mdyZEz0m3V
         yVFWqpGYyBNMc5ZwQIyyMgTcbXngbrmc31YbGfjkWW7wPuu/O9oMD3yXI6JOt//o/3dL
         CsPJnIGrgC3w71fZLE7AQfxtaCPV64Rp/UlVMTb+mBLJiMq/K2/MlYZKina3skGZqUTi
         fhyLJwQOofkFKXTqfj1e7/b3MH5BlZoi7b5IrnPYx0GNo8ziJk7MzBSRBpYFXeu4KqQ/
         Db9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=t+PhgsvGg4+eGtz8ppoYHcz9iOGtIlfGmF8+vfAfWhk=;
        b=UAly52H+jef/lQBb99NJGkMlWLdTG2KqR7cYVz/L8HuTFRH54Mq9MJVoRde80eW6mO
         8kRk/TWeMK7geMM5n9fT8K1Umf1EI/sMAgOG8wEIIu8MoRn4OVvx4+SOazrMPH1Vwfzz
         ASrbtPCG31wnRuUaal/cRj9Z30fkHJTtPjzc2yns1gEOWwACp+weHOtztE29rh/+OcAw
         6gED6rKuYLJxlj5lSvU5Ly6BCZ2pWSYga+XuvpNMm93rKdiz0ktq0JghYs+RkDKtEc2p
         aQAQVIo57odWitpSuOzMJ8avE19Z7Cb7PF0dABlarpz5xVeDmNtxhUc6z5jokXokNED3
         R6mw==
X-Gm-Message-State: AOAM532VaCsnF4NC8y9ajMuF3BmtFaUp7kyF4bg6ioZmL8ahqTAQ5GR1
        6H/cMUduTtAa4crJ90mni6s=
X-Google-Smtp-Source: ABdhPJzG0d3Qchzmosi9U2bv65KusHBBBAm7hmXpdnWgafi8FvK72zLbzP19WwP5fJyH9W4hEjpqmQ==
X-Received: by 2002:a17:90a:ed8e:: with SMTP id k14mr6205846pjy.178.1601700606579;
        Fri, 02 Oct 2020 21:50:06 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id ih12sm3136795pjb.24.2020.10.02.21.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 21:50:05 -0700 (PDT)
Date:   Fri, 2 Oct 2020 21:50:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.9-rc7
Message-ID: <20201003045003.GA1936980@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. A couple more drover quirks,
now enabling newer trackpoints from Synaptics for real.

Changelog:
---------

Jiri Kosina (1):
      Input: i8042 - add nopnp quirk for Acer Aspire 5 A515

Vincent Huang (1):
      Input: trackpoint - enable Synaptics trackpoints

Diffstat:
--------

 drivers/input/mouse/trackpoint.c      | 2 ++
 drivers/input/serio/i8042-x86ia64io.h | 7 +++++++
 2 files changed, 9 insertions(+)

Thanks.


-- 
Dmitry
