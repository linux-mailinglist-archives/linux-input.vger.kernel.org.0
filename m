Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 772D0121971
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2019 19:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfLPSw7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Dec 2019 13:52:59 -0500
Received: from li825-139.members.linode.com ([104.237.157.139]:50458 "EHLO
        smtp.factglobal.ca" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726281AbfLPSw7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Dec 2019 13:52:59 -0500
Received: from [192.168.42.166] (unknown [216.154.3.143])
        by smtp.factglobal.ca (Postfix) with ESMTPSA id 9D41178AFA
        for <linux-input@vger.kernel.org>; Mon, 16 Dec 2019 18:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kryma.net; s=mail;
        t=1576522378; bh=fjBXksq/lfPZHk5znGhRAtp7ypAmbYZrfsnAYJcRd7U=;
        h=To:From:Subject:Date:From;
        b=MJiBr+nqI7AXl3HFLfSHR4/MHohiNN0um00RzCaccqsc6MelEFwTDFUiGNtPMHk4r
         bJtWDmRg38QetjsyVlzu5VebItc+4xfCSgTH6TiJO/EO4B3xmV5zzUH9XLYpWYnFz2
         YrFVq/DlQO64eAvh+KoQ4ytQ6ZBQBjGPETby+WII=
To:     linux-input@vger.kernel.org
From:   Pavel Balan <admin@kryma.net>
Subject: Interface design advice
Message-ID: <6add23bb-db95-52d5-03d4-e1da2325e2f5@kryma.net>
Date:   Mon, 16 Dec 2019 13:52:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I'm currently porting a HID backlight peripheral to Linux.

The backlight has 4 sectors, each can have two independently set 
parameters - style and colour. What would be a good way to give the user 
access to this interface, without it being either obtuse or overdesigned?

