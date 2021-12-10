Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA52B46FF85
	for <lists+linux-input@lfdr.de>; Fri, 10 Dec 2021 12:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237323AbhLJLP0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Dec 2021 06:15:26 -0500
Received: from mga07.intel.com ([134.134.136.100]:54466 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230266AbhLJLPZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Dec 2021 06:15:25 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="301711554"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="301711554"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 03:11:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="516720795"
Received: from ccrisan-mobl2.ger.corp.intel.com (HELO tkristo-desk.intel.com) ([10.251.210.20])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 03:11:48 -0800
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        jikos@kernel.org, mika.westerberg@linux.intel.com,
        tero.kristo@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        peter.hutterer@who-t.net
Subject: [PATCHv4 0/5] HID: initial USI support patches
Date:   Fri, 10 Dec 2021 13:11:33 +0200
Message-Id: <20211210111138.1248187-1-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

As per request, this set contains initial USI support patches targeted
for 5.17. Any patches still under discussion dropped from this set.
Patch #3 is a split from previous revision, only containing the HID usage
definitions.

Series is based on top of hid/for-next.

-Tero


