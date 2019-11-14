Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABDE1FC922
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2019 15:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfKNOrh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Nov 2019 09:47:37 -0500
Received: from li825-139.members.linode.com ([104.237.157.139]:33830 "EHLO
        smtp.factglobal.ca" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726473AbfKNOrh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Nov 2019 09:47:37 -0500
X-Greylist: delayed 343 seconds by postgrey-1.27 at vger.kernel.org; Thu, 14 Nov 2019 09:47:36 EST
Received: from [192.168.0.187] (modemcable184.72-21-96.mc.videotron.ca [96.21.72.184])
        by smtp.factglobal.ca (Postfix) with ESMTPSA id EA39F7B94F
        for <linux-input@vger.kernel.org>; Thu, 14 Nov 2019 14:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kryma.net; s=mail;
        t=1573742513; bh=18fw5kOFkXsASEiKRKdXz0tp36AKlx7QWXIjlGkkSPo=;
        h=To:From:Subject:Date:From;
        b=ARc48BYQ6jkI7+svL3zKiCWBfZYRX4YbzAb9PjQwLiK21FFHfan9M/wqKG2dLxiEK
         KjA7wNKInvnCG+jcB0AyutV8DN+HPyxJ87dQmvGgcBcnPMriP1dk+otxyBmGCMdEZ3
         CFpaRsrKQH/xVX5+av+rabINzdFjR46GOF9FHbZU=
To:     linux-input@vger.kernel.org
From:   Pavel Balan <admin@kryma.net>
Subject: I2C HID incomplete report + misc debugging questions
Message-ID: <35e5a64f-41b0-188d-90aa-70b03f111ebc@kryma.net>
Date:   Thu, 14 Nov 2019 09:41:52 -0500
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

