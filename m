Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B752FCA0F
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2019 16:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfKNPir (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Nov 2019 10:38:47 -0500
Received: from li825-139.members.linode.com ([104.237.157.139]:33848 "EHLO
        smtp.factglobal.ca" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726474AbfKNPir (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Nov 2019 10:38:47 -0500
Received: from [192.168.0.187] (modemcable184.72-21-96.mc.videotron.ca [96.21.72.184])
        by smtp.factglobal.ca (Postfix) with ESMTPSA id 982BA7B94F
        for <linux-input@vger.kernel.org>; Thu, 14 Nov 2019 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kryma.net; s=mail;
        t=1573745926; bh=18fw5kOFkXsASEiKRKdXz0tp36AKlx7QWXIjlGkkSPo=;
        h=From:Subject:To:Date:From;
        b=VbDNblNR9vDekZBajuKdiWSFyPOKlQJ1RDEwmahXX3LiTpXMfNyFZGzQpD6FrvSgb
         GFFT0YMuFwIn2h2me4TVfwMV4OcQxe+FtOS14CU2rkw5/D9/h9R7OpKX3pqc0o/5tI
         qtKQ4fHHtNhilUBESv0CacETf2c+zfHt/3nynGDI=
From:   Pavel Balan <admin@kryma.net>
Subject: I2C HID incomplete report + misc debugging questions
To:     linux-input@vger.kernel.org
Message-ID: <a5a2b6b5-0bef-96c0-3d40-361f277f6761@kryma.net>
Date:   Thu, 14 Nov 2019 10:38:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Good day all,

I'm trying to create drivers for a device connected over I2C HID (a 
laptop backlight). Here are two things I would like to know:

1. The device, as it seems, hangs up for a few seconds on every 
un-suspend or boot. The following line is repeated:

[    5.667145] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete 
report (2/4)

Is there a pre-made I2C quirk I can toggle that solves that sort of 
problem, or would I have to dig deeper?


2. My workflow for working with USB devices was to modprobe the new 
driver in, then disconnect and reconnect the device again. A different 
approach is probably needed in this case, though I'm not yet sure which. 
Any recommendations? Possibly a way to get hidraw, if such exists?

Thanks for the help.


