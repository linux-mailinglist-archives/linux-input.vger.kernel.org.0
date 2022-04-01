Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4982F4EFCAB
	for <lists+linux-input@lfdr.de>; Sat,  2 Apr 2022 00:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241291AbiDAWOC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 Apr 2022 18:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235945AbiDAWOB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 1 Apr 2022 18:14:01 -0400
X-Greylist: delayed 447 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Apr 2022 15:12:10 PDT
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EAC1E31A0
        for <linux-input@vger.kernel.org>; Fri,  1 Apr 2022 15:12:10 -0700 (PDT)
Received: from [192.168.0.23] (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id 3960BA26C
        for <linux-input@vger.kernel.org>; Fri,  1 Apr 2022 15:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1648850682; bh=FTHDq+DfBHWFl+EtBDFvzsL7zy8T3fQNbQLgqb603Mg=;
        h=Date:To:From:Subject:From;
        b=bSJQ64SC0k/qXsDFpoczN60NUe11vLW4xHfYL4VO7SG2VYuupuWLy8t/fjJ2Yb9JQ
         zLjrMYXaCWz7ASmG2rFyODDxhk/ZtZR2hcnC5kMbI32bBttOsGVVjTLWp67dg0baeM
         nI7nmjZDfIkYxK4/KgyBxoDajJlx3IGHqSLn12eznp3IeQArEtj1DuhSSJUnLXbrqM
         Fd0D+qR3aWFsF3dbZVuz5kPIL+dfMW6hStMcAWFVUdKhjPDSBSHdbl2zkbGPaEdXtF
         0+Tvndyl3rZNSiJJSQVTyyvchlsKql/82lL8p2+n8f8pDChiJw9GZgr3Zmq1BFAONX
         vEIFRr4m+BZoA==
Message-ID: <b5f229c3-26e5-4fe1-aecb-504aa3c38bee@endrift.com>
Date:   Fri, 1 Apr 2022 15:04:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     linux-input@vger.kernel.org
From:   Vicki Pfau <vi@endrift.com>
Subject: Disabling HID reports while hidraw node is open
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I have been working on a project that does its own report processing on various game controllers by opening the hidraw node; however, at the same time, the drivers keep generating reports on the regular hid nodes in /dev/input. In general, this is not a problem, but some controllers, like the DualShock 4, present a mouse and/or keyboard input. In games, that mouse input can cause problems if the game expects the touchpad to be purely available as raw input and not also a discrete cursor that it doesn't even know is from the same source.

I've seen that the hid-steam driver has a check for if the hidraw is opened and unregisters the other hid nodes if that happens, but the more I look into implementing that approach in the hid-sony driver, the more it becomes clear that this goes against the grain of how hid drivers are expected to work: that driver creates a second, "fake" hid device that it then exposes only as a hidraw, prevents the real device from appearing as a hidraw, and uses an ll driver to tell when it's been opened.

This seems like a heavy-handed kludge at best, as it goes pretty far out of the way of what these APIs are intended for, and I was wondering if there's a better approach, or if a better approach should be implemented. While I know that X.org and/or Wayland can probably be manually told to stop paying attention to these hid devices, it seems like some sort of ioctl to the hidraw may be preferable in this case, though no such ioctl exists at the moment. Possibly another approach would be to be able to tell when a hidraw is opened without a massive workaround so the driver can decide what to do.

Either way, porting that kludge to another driver seems like perpetuating an anti-pattern, and I'm not really fond of that idea.

Vicki
