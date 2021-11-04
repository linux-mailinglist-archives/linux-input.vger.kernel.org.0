Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B86A445406
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 14:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhKDNj7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 09:39:59 -0400
Received: from mga12.intel.com ([192.55.52.136]:50270 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231137AbhKDNj6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 09:39:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211755170"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="211755170"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:13 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="501542000"
Received: from eyulyugi-mobl1.ger.corp.intel.com (HELO tkristo-desk.intel.com) ([10.251.215.15])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:11 -0700
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        mika.westerberg@linux.intel.com, tero.kristo@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 0/8] HID: add support for USI style pens
Date:   Thu,  4 Nov 2021 15:36:53 +0200
Message-Id: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This series is an RFC for USI (Universal Stylus Interface) style pen
support. This is based on documentation from USB org describing the HID
usage tables for digitizers (page 0x0D) and experimentation with actual
USI capable controllers.

This series introduces the USI support with a new HID driver, which
applies the controller specific quirks. The most problematic part of the
USI support is handling of the pen parameters (color, line width, line
style), which are not immediately available from the controller from pen
down event, but must be cached and queried separately from the controller.
In addition to that, when a get-feature report is sent to the
controller, there is a delay before the proper value is reported out; it
is not part of the feature report coming back immediately.
Most of the code in the driver is to handle this (otherwise we could
just use hid-generic.)

This also boils down to the reason why this series is an RFC, I would like
to receive some feedback which option to pick for programming of the new
values for the programmable pen parameters; whether to parse the input
events so userspace can directly write the new values to the input event
file handle, or whether to use IOCTL. Patches #7 / #8 are sort of optional
choices towards this, but are there to show that both approaches can be
done. Direct write to evdev causes some confusion on the driver level
though, thus patch #7 is there to avoid some of that introducing new
input events for writing the parameters. IOCTL might be the cleanest
approach and I am slightly leaning towards that myself (see patch #8,
this would need to be squashed and cleaned up a bit though but would
effectively get rid of some code from patch #6 and completely rid patch #7.)

The driver has been tested with chromebooks that contain either Goodix
or Elan manufactured USI capable touchscreen controllers in them.

Any feedback appreciated!

-Tero


