Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B81F45EE8F
	for <lists+linux-input@lfdr.de>; Fri, 26 Nov 2021 14:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbhKZNJO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Nov 2021 08:09:14 -0500
Received: from mga18.intel.com ([134.134.136.126]:38769 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235579AbhKZNHN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Nov 2021 08:07:13 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222532942"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="222532942"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 05:01:55 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="498395529"
Received: from asaechnx-mobl2.ccr.corp.intel.com (HELO tkristo-desk.intel.com) ([10.249.34.152])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 05:01:52 -0800
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        jikos@kernel.org, mika.westerberg@linux.intel.com,
        tero.kristo@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        peter.hutterer@who-t.net
Subject: [RFCv2 0/8] USI stylus support series
Date:   Fri, 26 Nov 2021 15:01:33 +0200
Message-Id: <20211126130141.1811848-1-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This series is an update based on comments from Benjamin. What is done
is this series is to ditch the separate hid-driver for USI, and add the
generic support to core layers. This part basically brings the support
for providing USI events, without programmability (patches 1-6).

Additionally, a HID-BPF based sample is provided which can be used to
program / query pen parameters in comparison to the old driver level
implementation (patches 7-8, patch #8 is an incremental change on top of
patch #7 which just converts the fifo to socket so that the client can
also get results back from the server.)

The whole series is based on top of Benjamin's hid-bpf support work, and
I've pushed a branch at [1] with a series that works and brings in
the dependency. There are also a few separate patches in this series to
fix the problems I found from Benjamin's initial work for hid-bpf; I
wasn't able to get things working without those. The branch is also
based on top of 5.16-rc2 which required some extra changes to the
patches from Benjamin.

-Tero

[1] https://github.com/t-kristo/linux/tree/usi-5.16-rfc-v2-bpf


