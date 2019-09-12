Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98C1FB0D91
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2019 13:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730268AbfILLIQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Sep 2019 07:08:16 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36592 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfILLIQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Sep 2019 07:08:16 -0400
Received: by mail-wm1-f65.google.com with SMTP id t3so3049372wmj.1
        for <linux-input@vger.kernel.org>; Thu, 12 Sep 2019 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=8hQvEomEfmNr7B/7XzQ2xkOX9soUNEoC5wkWTGSAH4w=;
        b=GWCNwfdukjaqm/Vq2Hv/yoo3d4Ee5TZOo0sJ+73mQL8ydAgDYzQcGQdOncaZjOVF4z
         KKvnAKFZ2uHqMzE4A1UAGfnGQSf2CIvht9DYaA01DOtNkSpI8yq8ICL2aOT6eBmjfmWu
         Nk/ynkyhjJ7r+nRRvN2JvUfA6SFvK2TQzV7C6IrvgdF0ClmDkm3qUShM/U51a4nI17ok
         VC+Ze/HUpl8jeoivYmhM0uXz2GVtXCxKBwLsxzaHH385xgZV/U0tId1dKP71Aaoj8DhI
         K4Pw4uAjRQ11SC0BEMGkmN94/yrag/Lsfe5vt90RdqojFC2U9G5E7D83GHplAxu6COO0
         /iAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8hQvEomEfmNr7B/7XzQ2xkOX9soUNEoC5wkWTGSAH4w=;
        b=tuZSiTh+cu6WjMGZeT4rZnwQMvX5fKsx1pBDPRlm8CNV1NXvfM71aN6X0YYUa8hcBk
         WcELbiQXKGpun1ijB8suNF1UK64ellrN3YmawpG0Dx/cYvz7bqnqVDRJPRGbiYHCCZT4
         RXZsH9BJPwcmgIawROqluX9YPQ43apkcZc8vHszsomR5UeGQHsL//BPmVTNsRFuLxjtV
         sniSqovZfIR9PsalV/qOYuTh6WMdwWGRsex3RcSwDdGEXrikvAOwmyKoEi2OBqJOdK0I
         A11XwYChH+q/EcZsMlajYcEdNNxiBNDWNEoUntmvEXwg3awbTalmQohfKOcl/bXrxn35
         Q2lw==
X-Gm-Message-State: APjAAAV6Ixl6rt+gZ5g4BVNbfaar2qarnI+dl2SzXddQXeZHxVhKwjrM
        +uYu1Fux4I8zQVfRvjeJIAAh4umz1Bfd+H4X
X-Google-Smtp-Source: APXvYqw7q5q7W3LoFEAoJeG7uRvqgPefMkqPWyepwYuViTV1Ku9HMOsa+OWGtL6Gk11iJh/JhMgdXg==
X-Received: by 2002:a7b:c856:: with SMTP id c22mr7664109wml.107.1568286494021;
        Thu, 12 Sep 2019 04:08:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:1e51:7ba0:c57b:6743])
        by smtp.gmail.com with ESMTPSA id 207sm8959018wme.17.2019.09.12.04.08.13
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:08:13 -0700 (PDT)
Date:   Thu, 12 Sep 2019 12:08:09 +0100
From:   Siarhei Vishniakou <svv@google.com>
To:     linux-input@vger.kernel.org
Subject: Re: [PATCH v5 0/5] HID: joycon
Message-ID: <20190912110809.GA6648@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603060644.10338-1-djogorchock@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Thanks for the patchset. Some questions and comments on the driver:

1. In the rumble patch, there are some functions that are only used if
CONFIG_JOYCON_FF is enabled. Otherwise, the compiler complains about
unused functions. Could you guard these with #ifdef?

2. Inside hid-ids, most of the defines use tabs, but the current patch
uses spaces. Could you change to use tabs?

3. Currently, the driver quits and prints an error if it is not able to
read the calibration data. That means, if the device is being simulated
using /dev/uhid, it is necessary to also properly respond to these
low-level requests for flash memory reading. This is doable, but is a
lot of work. Any way to allow the driver to continue to function even if
calibration data is missing? Maybe just print a warning that the sticks
won't function well?

4. The word "synchronous" is mispelled

5. Currently, in this driver, the DPAD presses generate key events.
However, most of the other drivers for today's popular controllers, like
DS4 and xbox, produce axis events for these. Is it possible to use axis
in this driver, in order to make it easier for applications to handle
these?

6. There is currently a compiler error in joycon_rumble_amplitudes.
The last (max) amplitude is not a compile-time constant. Suggest to
revise as follows:
static const u16 joycon_max_rumble_amp = 1003;
...
static const struct joycon_rumble_amp_data joycon_rumble_amplitudes[] = {
...
{ 0xc8, 0x0072, joycon_max_rumble_amp }
};

7. In hid-joycon.c, there are currently a lot of defines for different
commands, such as JC_INPUT_BUTTON_EVENT. My personal preference is to
use const u8 for these for type safety.


