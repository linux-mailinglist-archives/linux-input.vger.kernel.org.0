Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B214FE9EC4
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2019 16:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfJ3PVS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Oct 2019 11:21:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41832 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbfJ3PVS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Oct 2019 11:21:18 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4C5FD86658
        for <linux-input@vger.kernel.org>; Wed, 30 Oct 2019 15:21:18 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id b10so1032035wmh.6
        for <linux-input@vger.kernel.org>; Wed, 30 Oct 2019 08:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=XnTh+lDrEhWAmNyjcTyFRpG8eVBQ+kooBO6IR8Hvflc=;
        b=b/eNMkpY8gPebJhx9WHrk2rrH78xMOIsorObMgP15CI4FviHFG3bx4ffJ2uVXp6bsT
         IumEiqOOmEftLqqIoRYVvINeAISJgK0SJ/fhcigvOATw33cMou+Wkt+c7TojsQcCbOUa
         mdVvQ27fcnqqM3ndAteJKW/mC6XRKdtT4YN2QDqYjmQvnwkdGoCHxlD2S1ermh8bZHgu
         KM0a6SrS6rtMtFkCQQ6gZBMBOV/byGgvcdvyTR50FcaDVPaMlzmz5Pk8+lL7Go1Y8aEE
         aq/aB6dO2DFVH8dfnuo5milLfZgAP3gr2MK24Gu0dij0D9XjEgLwYYdgkXCHgOrGxkN7
         pWdg==
X-Gm-Message-State: APjAAAXD9VNew0GZqgF8uOzwEbnMU4GPk6DNksJxgP5oR4NhbU27WGYD
        pZNH2dmj6OPlTC7rjs9vtLzledSy6fDmOO3Zd26caCmS+PzDT2i6MK+zn/Vb9ujajUaZaNkiZsO
        f15O90/pLg02mDwy8//hlggM=
X-Received: by 2002:a7b:c76d:: with SMTP id x13mr9568380wmk.155.1572448876776;
        Wed, 30 Oct 2019 08:21:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDkHO0H2jD8gQhafP8voizs6xxduhcukz9D9yiKMuCCFvohxZguYZfGGJkCwI1SAkd++9SXQ==
X-Received: by 2002:a7b:c76d:: with SMTP id x13mr9568361wmk.155.1572448876611;
        Wed, 30 Oct 2019 08:21:16 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id 36sm740364wrj.42.2019.10.30.08.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 08:21:15 -0700 (PDT)
To:     Jiri Kosina <jikos@jikos.cz>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-input@vger.kernel.org
From:   Hans de Goede <hdegoede@redhat.com>
Subject: i2c-hid regression in 5.4 (Linus' master)
Message-ID: <f52784fe-f1f5-5147-2c10-e93ca7e51805@redhat.com>
Date:   Wed, 30 Oct 2019 16:21:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri, Benjamin,

I just noticed that commit 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
was merged as a fix for 5.4 2 days ago.

I believe that this is a good idea in general as it should fix issues with
touchscreens / touchpads on various devices. But about a week ago I noticed a
regression caused by this. Specifically it causes SIS i2c-hid touchscreens to
stop working. These are used in various devices. I know of at least 4 models,
some of which are quite popular, which use SIS touchscreens:

Asus T100HA
Asus T200TA
Peaq 10.1" C1010 2-in-1
Toshiba Click Mini L9W-B

I submitted a patch fixing the regression as soon as I found it,
there were some questions about this patch, which I did not answer
immediately (-EBUSY), as back then this was 5.5 material. Now that
this has been added to 5.4, I've prioritized this and I've answered
the questions. Assuming you are ok with the approach, we really
should get my patch added to 5.4, to avoid this change causing
regressions.

Regards,

Hans
