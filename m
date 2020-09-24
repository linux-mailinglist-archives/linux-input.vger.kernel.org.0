Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876FA276A7B
	for <lists+linux-input@lfdr.de>; Thu, 24 Sep 2020 09:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgIXHRj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Sep 2020 03:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgIXHRj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Sep 2020 03:17:39 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D51C0613CE
        for <linux-input@vger.kernel.org>; Thu, 24 Sep 2020 00:17:39 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id r19so1217272pls.1
        for <linux-input@vger.kernel.org>; Thu, 24 Sep 2020 00:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6hGNY8pbaSiGY4u0dA760+n9R7SCtDJ75PmG1ZkFDG4=;
        b=fNciyQKKY5yWVGE4N7aAIGXonpX3WA8YJtvYJjzmMBT4vnoWQ1uw2S9DrJUJM0q61G
         4FE/TQn9ti3m594uMLMhPp/udpt6F9MakjrWyw6l1lMxWWWl0BcBVp0FNEFEjRnhRiz1
         bo482qRoXvm+re432m6TNkkZXoECX4vZD4CJi0QVoBlRSwrg+sP/HmtUIWKO1k87V8gL
         3fMFlWAaF4jAUfc7zj+sWuY95ILWMmgndk7omp/+wNwga9OR+0XYRqm+QNp+4p3phP/E
         1yM3XXieHSOhSCSRizZS8DAy3yWVfHsTzf/CEd4onNsgaUqsvp0Om/N3N+RoAeg5Ttnu
         qEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6hGNY8pbaSiGY4u0dA760+n9R7SCtDJ75PmG1ZkFDG4=;
        b=ZQ/HQHKDLYn+k/kD3rYQbLkh7EfqKfXbxoNjQNTZayDYKXn8hz6C9j7cltt1nkBYXQ
         DS6sWi2WJobFqnwozKkzXYHULD6aYsL9rarWkCpFrM1+P8cxA9yNb5EkeuJm5H9hVCHc
         nS7MO28NffcYfrUxKKrv4JLl+2dhc3UFrgmw293CQQnmtedPPpUeb9/7wc0uliXhkPvP
         zZ6jIFLc9Tg7xNQZX5cAU55vWQdMsX1iNdYVPe+LYmkGmbGPUc7039L3odoDbQh9r/X/
         scr/cZRWvBp/JVtZqznRfP7e1ug0azvQ6IYKMUkWQKx5GXY9lhPzW74KOhjuBw1a+p0M
         ON0Q==
X-Gm-Message-State: AOAM5330aPCqEc0i2h9JH+AN7UFQalunj2hcRi2Kjwd/nWz8905PA2s8
        9J+iOiRgWYjO/KFOYb5b3/4=
X-Google-Smtp-Source: ABdhPJzOIEh5Vfsq4BovFbk2mZbP9kglqaVYN7UwokInMM9pjuPNH+CNvWZgDpNQz7yf7fRkpKwdHg==
X-Received: by 2002:a17:902:a50b:b029:d1:e5e7:bdd2 with SMTP id s11-20020a170902a50bb02900d1e5e7bdd2mr3331519plq.50.1600931858222;
        Thu, 24 Sep 2020 00:17:38 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id k11sm1530502pjs.18.2020.09.24.00.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 00:17:36 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Thu, 24 Sep 2020 15:17:25 +0800
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Advice on fixing the bug of MSFT0001:00 04F3:Touchpad being
 handled by hid_multitouch by mistake
Message-ID: <20200924071725.63xe6hpcopz732rs@Rk>
References: <20200811091445.erp2b23xmx3ceyzp@Rk>
 <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
 <20200904145916.nighviqyrvbm2ybx@Rk>
 <CAO-hwJJAOGNVnu1_dwXTMUyoSsNQifGFDUV6e9g96wHKmaZqSA@mail.gmail.com>
 <20200910163729.z6gmpeg7x2ocjvpt@Rk>
 <CAO-hwJ+P3iU87Ra=3bzJ2f53hPPxGKb+v1+kPSNj5TJVy+NqGA@mail.gmail.com>
 <20200915101451.hrqs4aobnwtmo3sm@Rk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="afvcpm7vfj6w6dcw"
Content-Disposition: inline
In-Reply-To: <20200915101451.hrqs4aobnwtmo3sm@Rk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--afvcpm7vfj6w6dcw
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Benjamin,

I think I've found the decisive evidence showing that there's
something wrong with the GPIO chip's interrupt setting of this laptop
model of Lenovo Legion-5 15ARH05 but there's nothing wrong with the
touchpad like scanning frequency, report rate, etc.

This GPIO interrupt controller has been assigned with IRQ#7 and
the touchpad's interrupt line is connected to the GPIO chip's
pin#130.

         Device (GPIO)
         {
             Name (_HID, "AMDI0030")  // _HID: Hardware ID
             Name (_CID, "AMDI0030")  // _CID: Compatible ID
             Name (_UID, Zero)  // _UID: Unique ID
             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
             {
                 Name (RBUF, ResourceTemplate ()
                 {
                     Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                     {
                         0x00000007,
                     }
                 })
                 Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
             }

         }

  Scope (_SB.I2CD)
     {
         Device (TPDD)
         {
             Name (_HID, "XXXX0000")  // _HID: Hardware ID
             Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
             Name (_SUB, "XXXX0000")  // _SUB: Subsystem ID
             Method (_INI, 0, NotSerialized)  // _INI: Initialize
             {
                 If ((TPTY == One))
                 {
                     _HID = "MSFT0001"
                     _SUB = "ELAN0001"
                 }

                 If ((TPTY == 0x02))
                 {
                     _HID = "MSFT0001"
                     _SUB = "SYNA0001"
                 }

                 Return (Zero)
             }

             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
             {
                 If ((TPTY == One))
                 {
                     Name (SBFB, ResourceTemplate ()
                     {
                         I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                             AddressingMode7Bit, "\\_SB.I2CD",
                             0x00, ResourceConsumer, , Exclusive,
                             )
                     })
                 }

                 If ((TPTY == 0x02))
                 {
                     Name (SBFS, ResourceTemplate ()
                     {
                         I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                             AddressingMode7Bit, "\\_SB.I2CD",
                             0x00, ResourceConsumer, , Exclusive,
                             )
                     })
                 }
                 Name (SBFI, ResourceTemplate ()
                 {
                     GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                         "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0082
                         }

When there's new data from the touchpad, IRQ#7 will be activated. The
handler amd_gpio_irq_handler will iterate over the pins and find
pin#130 is the source of the interrupt. Then i2c_hid_irq will be
woken up to read HID reports. Here's the code execution path,

<IRQ>
dump_stack+0x64/0x88
__irq_wake_thread.cold+0x9/0x12
__handle_irq_event_percpu+0x80/0x1c0
handle_irq_event+0x58/0xb0
handle_level_irq+0xb7/0x1a0
generic_handle_irq+0x4a/0x60
amd_gpio_irq_handler+0x15f/0x1b0 [pinctrl_amd]
__handle_irq_event_percpu+0x45/0x1c0
handle_irq_event+0x58/0xb0
handle_fasteoi_irq+0xa2/0x210
do_IRQ+0x70/0x120
common_interrupt+0xf/0xf
</IRQ>

So I add some debugging code to track when each IRQ#7 will be handled
and what's the status of pin#130 as I move my finger on the surface of
the touchpad for about 0.5s. It turns out i2c_hid_irq can handle ~500
interrupts per second but IRQ#7 is only fired ~7 times per second.
During the time of I move the finger, pin#130 has the input of low
("active low", meaning touchpad has asserted its interrupt line to
indicate new data) most of the time. So my next step is to find out
why IRQ#7 fails to fire when the touchpad has received new data.

Please check the attachments for the details,
  - handler_irq72: timing of hanlder of IRQ#7
  - touchpad_interrupt: the status of touchpad interrupt line
  - handler_irq7_touchpad_interrupt.pdf: the plotting

Btw, I've added a polling mode for rivers/hid/i2c-hid/i2c-hid-core.c
when trying to fix the touchpad issue. With the polling mode, the
cursor is able to follow the movement of my finger.


Patches of debugging code
========================#

When the kernel receives IRQ#7

$ diff kernel/irq/chip.{ori,c} -u
--- kernel/irq/chip.ori 2020-09-22 22:56:33.684265452 +0800
+++ kernel/irq/chip.c   2020-09-22 23:25:40.435297613 +0800
@@ -699,6 +699,12 @@
  void handle_fasteoi_irq(struct irq_desc *desc)
  {
         struct irq_chip *chip = desc->irq_data.chip;
+    struct timespec64 ts1, ts2;
+    unsigned int irq = irq_desc_get_irq(desc);
+
+    if (irq == 7) {
+        ktime_get_ts64(&ts1);
+    }

         raw_spin_lock(&desc->lock);

@@ -727,6 +733,11 @@
         cond_unmask_eoi_irq(desc, chip);

         raw_spin_unlock(&desc->lock);
+    if (irq == 7) {
+        ktime_get_ts64(&ts2);
+        pr_alert("handle_fasteoi_irq: %d, %llu %llu, %llu %llu", irq,  ts1.tv_sec, ts1.tv_nsec, ts2.tv_sec-ts1.tv_sec, ts2.tv_nsec-ts1.tv_nsec);
+        dump_stack();
+    }
         return;
  out:
         if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))

When the kernel finished processing IRQ#7

$ diff drivers/pinctrl/pinctrl-amd.{c,ori} -u -p
--- drivers/pinctrl/pinctrl-amd.c       2020-09-24 14:51:50.815843952 +0800
+++ drivers/pinctrl/pinctrl-amd.ori     2020-09-20 11:57:40.867390865 +0800
@@ -389,7 +389,6 @@ static void amd_gpio_irq_unmask(struct i
  {
         u32 pin_reg;
         unsigned long flags;
-    struct timespec64 ts1;
         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
         struct amd_gpio *gpio_dev = gpiochip_get_data(gc);

@@ -397,8 +396,6 @@ static void amd_gpio_irq_unmask(struct i
         pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
         pin_reg |= BIT(INTERRUPT_MASK_OFF);
         writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
-    ktime_get_ts64(&ts1);
-    pr_alert("gpio_unmask %u: %llu %llu", d->hwirq, ts1.tv_sec, ts1.tv_nsec);
         raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
  }


Polling the status of pin#130 every 1ms for 1 second

$ diff drivers/hid/i2c-hid/i2c-hid-core.{ori,c} -u -p
--- drivers/hid/i2c-hid/i2c-hid-core.ori        2020-09-10 12:35:36.160989731 +0800
+++ drivers/hid/i2c-hid/i2c-hid-core.c  2020-09-24 14:54:17.481705797 +0800
@@ -522,10 +522,54 @@ static void i2c_hid_get_input(struct i2c
         return;
  }

+static struct task_struct *thread_hid;
+
+#include <linux/gpio/driver.h>
+#include <linux/kthread.h>
+#define times 1000
+int get_pin_state_thread(void *irq_d)
+{
+    struct irq_desc *irq_desc = irq_d;
+       struct gpio_chip *gc = irq_data_get_irq_chip_data(&irq_desc->irq_data);
+    int i;
+    int *stat;
+    struct timespec64 *ts;
+
+    stat = kmalloc(sizeof(int) * times, GFP_KERNEL);
+    ts = kmalloc(sizeof(struct timespec64) * times, GFP_KERNEL);
+
+    for (i = 0; i < times; i++) {
+        usleep_range(1000, 1000);
+        stat[i] = gc->get(gc, 130);
+        ktime_get_ts64(&ts[i]);
+    }
+
+    for (i = 0; i < times; i++) {
+        pr_alert("pin130_state: %d %lld %ld %d", i, ts[i].tv_sec, ts[i].tv_nsec, stat[i]);
+    }
+    kfree(stat);
+    kfree(ts);
+    thread_hid = NULL;
+    do_exit(0);
+    return 0;
+       /** struct amd_gpio *gpio_dev = gpiochip_get_data(gc); */
+
+}
+
  static irqreturn_t i2c_hid_irq(int irq, void *dev_id)
  {
         struct i2c_hid *ihid = dev_id;
+    struct irq_desc *irq_desc;

+    irq_desc = irq_to_desc(irq);
+    if (!thread_hid) {
+        thread_hid = kthread_create(get_pin_state_thread, irq_desc, "mythread_ihid");
+        if (thread_hid) {
+            ktime_get_ts64(&ts1);
+            pr_alert("hid_thread created: %lld %ld", ts1.tv_sec, ts1.tv_nsec);
+            wake_up_process(thread_hid);
+        }
+    }
         if (test_bit(I2C_HID_READ_PENDING, &ihid->flags))
                 return IRQ_HANDLED;

On Tue, Sep 15, 2020 at 06:14:51PM +0800, Coiby Xu wrote:
>On Fri, Sep 11, 2020 at 02:29:03PM +0200, Benjamin Tissoires wrote:
>>Hi,
>>
>>On Thu, Sep 10, 2020 at 6:37 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>>
>>>On Fri, Sep 04, 2020 at 06:47:42PM +0200, Benjamin Tissoires wrote:
>>>>On Fri, Sep 4, 2020 at 4:59 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>>>>
>>>>> On Fri, Sep 04, 2020 at 10:16:51AM +0200, Benjamin Tissoires wrote:
>>>>> >Hi,
>>>>> >
>>>>> >On Tue, Aug 11, 2020 at 11:15 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>>>>> >>
>>>>> >> Hi,
>>>>> >>
>>>>> >> I'm working on a touchpad device issue as reported on
>>>>> >> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.
>>>>> >>
>>>>> >> This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
>>>>> >> hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,
>>>>> >>
>>>>> >>      1. When scanning this device's report descriptor, HID_DG_CONTACTID
>>>>> >>         usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
>>>>> >>         the device.
>>>>> >>      2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
>>>>> >>         HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
>>>>> >>      3. hid-multitouch.c claims handling devices with the group of
>>>>> >>         HID_GROUP_MULTITOUCH_WIN_8
>>>>> >>
>>>>> >>          static const struct hid_device_id mt_devices[] = {
>>>>> >>                 /* Generic MT device */
>>>>> >>                 { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
>>>>> >>
>>>>> >>                 /* Generic Win 8 certified MT device */
>>>>> >>                 {  .driver_data = MT_CLS_WIN_8,
>>>>> >>                         HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
>>>>> >>                                 HID_ANY_ID, HID_ANY_ID) },
>>>>> >>                 { }
>>>>> >>          };
>>>>> >>
>>>>> >> There are several potential solutions,
>>>>> >>      - Let the device vendor fix this problem since this device's report
>>>>> >>        descriptor shouldn't have the HID_DG_CONTACTID usage.
>>>>> >>      - Make it a special case by setting the device's group to
>>>>> >>        HID_GROUP_RMI in hid_scan_report when vendor id and product ID
>>>>> >>        are matched.
>>>>> >>      - hid-quirks.c seems to be designed to handle special cases, is it
>>>>> >>        suitable for this case?
>>>>> >
>>>>> >AFAIU, the touchpad doesn't work at all with hid-multitouch. So I
>>>>> >guess the best is to add the VID/PID to hid-quirks.c in
>>>>> >hid_have_special_driver[], and add it to the hid-rmi driver too.
>>>>> >This way, you will ensure hid-rmi will pick up the device all the time.
>>>>> >
>>>>> >Cheers,
>>>>> >Benjamin
>>>>>
>>>>> Thank you for the advice! I have exactly adopted this approach by looking
>>>>> at commit e9287099ba6539bccb20cd791269186f3ae28b85
>>>>> ("HID: rmi: Add support for the touchpad in the Razer Blade 14 laptop")
>>>>> as an example.
>>>>>
>>>>> My previous email is a bit misleading because 0x04F3 is the vendor code
>>>>> of ELAN while hid-rmi is for the Synaptics touchpad. And actually this
>>>>> laptop model of Lenovo Legion-5 15ARH05 is shipped with both kinds of
>>>>> touchpads,
>>>>>
>>>>> - for the Synaptics touchpad, hid-rmi could almost handle it perfectly
>>>>>    except the clicking is not sensitive enough. I need to let my finger
>>>>>    linger on the touchpad for a while. I notice when I click on the touchpad,
>>>>>    an HID report would be received by hid-recorder. But evtest couldn't receive
>>>>>    any EV_ event. If hid-multitouch is handling the device, the cursor
>>>>>    won't move but 2-4 finger touching events could still be received by
>>>>>    evtest.
>>>>>
>>>>> - for the ELAN touchpad, only HID reporters can be read and parsed by
>>>>>    hid-core then two input devices (mouse and touchpad) could created by
>>>>>    hid-multitouch as seen from /proc/bus/input/devices. But hid-recorder
>>>>>    could never get any HID report.
>>>>
>>>>huh. So in both cases you have a buggy touchpad with hid-multitouch :(
>>>>
>>>>Do both touchpads share the same VID/PID? If so, this is going to be
>>>>interesting to decide how any of those touchpad should be handled.
>>>
>>>No, they have different VID/PIDs,
>>>  - 04F3:3140 (Elan)
>>>  - 06CB:7F28 (Synaptics)
>>
>>That's good to know :)
>>
>>>
>>>>
>>>>>
>>>>> AFAIU, isn't hid-multitouch supposed to be the implementation of Windows
>>>>> Precision Touchpad?
>>>>
>>>>yes, it works for most of those. The only ones that are not working
>>>>are usually because OEM or device makers tend to do "fun" things.
>>>>
>>>>>  And since Precision touchpad is mandatory for
>>>>> Windows 10 notebooks and this laptop model of Lenovo Legion-5 15ARH05
>>>>> seem to have been certificated by Windows 10, does it mean by theory
>>>>> hid-multiouch could handle these two touchpad devices?
>>>>
>>>>Well, it should, yes, but it clearly can not. You can try to give a
>>>>try at hid-recorder from
>>>>https://gitlab.freedesktop.org/libevdev/hid-tools. This will show what
>>>>is actually exported by the hardware before any processing by the
>>>>kernel. Maybe there is a new simple thing to do in hid-multitouch to
>>>>handle those devices.
>>>>
>>>>Also, last time I heard, Synaptics dropped the use of hid-rmi in favor
>>>>of hid-multitouch. Any hid-rmi touchpad should be able to use
>>>>hid-multitouch, as this is the preferred way on Windows. But sometimes
>>>>the various teams decide to change the rules.
>>>>
>>>>>
>>>>> Anyway, it seems I need to install Windows Driver Kit to capture&analyze
>>>>> HID reports to see what's happening. Or do you have any suggestion?
>>>>
>>>>Unless it changed recently (I think I have seen something like that
>>>>recently), I had to write a I2C man-in-the-middle to dump the logs
>>>>from Windows. Project is at
>>>>https://github.com/bentiss/SimplePeripheralBusProbe and requires a
>>>>little bit of manual work to be able to start capturing data :(
>>>>
>>>>Cheers,
>>>>Benjamin
>>>>
>>>>>
>>>>> --
>>>>> Best regards,
>>>>> Coiby
>>>>>
>>>>
>>>
>>>Thank you for developing hid-tools and SimplePeripheralBusProbe!
>>
>>No worries.
>>
>>Wow, I am really impressed in how quickly you managed to get all that
>>data. I think it's the first time I ever point somebody at
>>SimplePeripheralBusProbe, and I don't have to do anything to get this
>>up and running, and analyzed :)
>
>Thank you! The instructions of setting up SimplePeripheralBusProbe
>are well-documented so it's quite a straightforward process:)
>
>>
>>>
>>>The problem with the Synaptics touchpad when it's handled by hid-multiouch
>>>is the pointer won't move. A few days ago, I took another look at the
>>>results produced by hid-recorder and evtest and noticed something abnormal
>>>for the Synaptics touchpad. For a straight continuous motion of one finger,
>>>the value of ABS_MT_TRACKING_ID kept changing,
>>>
>>>$ sudo evtest
>>>...
>>>Event: time 1599651409.969002, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 68
>>>Event: time 1599651409.969002, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 401
>>>Event: time 1599651409.969002, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 201
>>>Event: time 1599651409.969002, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
>>>Event: time 1599651409.969002, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
>>>Event: time 1599651409.969002, type 3 (EV_ABS), code 0 (ABS_X), value 401
>>>Event: time 1599651409.969002, type 3 (EV_ABS), code 1 (ABS_Y), value 201
>>>Event: time 1599651409.969002, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 0
>>>Event: time 1599651409.969002, -------------- SYN_REPORT ------------
>>>Event: time 1599651410.070105, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
>>>Event: time 1599651410.070105, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
>>>Event: time 1599651410.070105, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
>>>Event: time 1599651410.070105, -------------- SYN_REPORT ------------
>>>Event: time 1599651410.093740, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 69
>>>Event: time 1599651410.093740, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
>>>Event: time 1599651410.093740, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
>>>Event: time 1599651410.093740, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 7200
>>>Event: time 1599651410.093740, -------------- SYN_REPORT ------------
>>>Event: time 1599651410.196576, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
>>>Event: time 1599651410.196576, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
>>>Event: time 1599651410.196576, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
>>>Event: time 1599651410.196576, -------------- SYN_REPORT ------------
>>>Event: time 1599651410.219020, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 70
>>>Event: time 1599651410.219020, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 406
>>>Event: time 1599651410.219020, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 204
>>>Event: time 1599651410.219020, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
>>>Event: time 1599651410.219020, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
>>>Event: time 1599651410.219020, type 3 (EV_ABS), code 0 (ABS_X), value 406
>>>Event: time 1599651410.219020, type 3 (EV_ABS), code 1 (ABS_Y), value 204
>>>Event: time 1599651410.219020, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 129000
>>>Event: time 1599651410.219020, -------------- SYN_REPORT ------------
>>>Event: time 1599651410.320097, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
>>>Event: time 1599651410.320097, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
>>>Event: time 1599651410.320097, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
>>>Event: time 1599651410.320097, -------------- SYN_REPORT ------------
>>>Event: time 1599651410.343867, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 71
>>>Event: time 1599651410.343867, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 424
>>>Event: time 1599651410.343867, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 218
>>>Event: time 1599651410.343867, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
>>>Event: time 1599651410.343867, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
>>>Event: time 1599651410.343867, type 3 (EV_ABS), code 0 (ABS_X), value 424
>>>Event: time 1599651410.343867, type 3 (EV_ABS), code 1 (ABS_Y), value 218
>>>Event: time 1599651410.343867, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 250900
>>>...
>>>
>>>while hid-recorder showed "Tip Switch" remained 1 and the "contact Id"
>>>remained 0 for this set of reports,
>>>
>>>$ sudo hid-recorder
>>>
>>># ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    401 | Y:    201
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  14579 | Contact Count:    1 | Button: 0 | #
>>>E: 000000.000000 30 03 03 91 01 c9 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f3 38 01 00
>>># ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    401 | Y:    201
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  14651 | Contact Count:    1 | Button: 0 | #
>>>E: 000000.124738 30 03 03 91 01 c9 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3b 39 01 00
>>># ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    406 | Y:    204
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  15869 | Contact Count:    1 | Button: 0 | #
>>>E: 000000.249932 30 03 03 96 01 cc 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fd 3d 01 00
>>># ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    424 | Y:    218
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  17088 | Contact Count:    1 | Button: 0 | #
>>>E: 000000.374781 30 03 03 a8 01 da 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 c0 42 01 00
>>># ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    449 | Y:    251
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  18379 | Contact Count:    1 | Button: 0 | #
>>>E: 000000.499704 30 03 03 c1 01 fb 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 cb 47 01 00
>>># ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    475 | Y:    281
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>>>#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  19598 | Contact Count:    1 | Button: 0 | #
>>>
>>>
>>>I managed to let hid-multitouch to send the set of input events with the
>>>same ABS_MT_TRACKING_ID by disabling the release_timer via commenting out
>>>the following code,
>>>
>>>// drivers/hid/hid-multitouch.c
>>>static void mt_touch_report(struct hid_device *hid,
>>>                            struct mt_report_data *rdata)
>>>{
>>>     ...
>>>         * Windows 8 specs says 2 things:
>>>         * - once a contact has been reported, it has to be reported in each
>>>         *   subsequent report
>>>         * - the report rate when fingers are present has to be at least
>>>         *   the refresh rate of the screen, 60 or 120 Hz
>>>         *
>>>         * I interprete this that the specification forces a report rate of
>>>         * at least 60 Hz for a touchscreen to be certified.
>>>         * Which means that if we do not get a report whithin 16 ms, either
>>>         * something wrong happens, either the touchscreen forgets to send
>>>         * a release. Taking a reasonable margin allows to remove issues
>>>         * with USB communication or the load of the machine.
>>>         *
>>>         * Given that Win 8 devices are forced to send a release, this will
>>>         * only affect laggish machines and the ones that have a firmware
>>>         * defect.
>>>         */
>>>        /* if (app->quirks & MT_QUIRK_STICKY_FINGERS) {
>>>                if (test_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags))
>>>                        mod_timer(&td->release_timer,
>>>                                  jiffies + msecs_to_jiffies(100));
>>>                else
>>>                        del_timer(&td->release_timer);
>>>        } */
>>>     ...
>>>}
>>>
>>>Now the pointer can move but there is a noticeable lag as I move my
>>>finger. evhz shows the report rate is only ~7Hz. While under Windows,
>>>SimplePeripheralBusProbe shows there are 25+ reports for one finger
>>>sliding event. This also explains why under Linux release_timer keeping
>>>inactivating report slots.
>>
>>Yep, you found the root cause. We don't have enough reports to ensure
>>a proper reporting mechanism.
>>
>>>
>>>
>>>Comparing the hid commands sent between Windows and Linux, they are
>>>almost identical. SimplePeripheralBusProbe doesn't record hid commands
>>>like fetching HID descriptor, report descriptor, resetting the device.
>>>I haven't yet found a clue about why this Synaptics touchpad operates
>>>with such a report rate under Linux.
>>>
>>>Under Linux, the follow hid commands are sent to the touchpad device.
>>>
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=20 00
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 08
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 01
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 08
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=21 00
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 38 02 23 00
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 38 02 23 00
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 37 02 23 00
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 3d 03 23 00 04 00 0d 00
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 34 03 23 00 04 00 04 03
>>>Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 36 03 23 00 04 00 06 03
>>>
>>>whereas under Windows,
>>>
>>>[0]0000.0000::09/09/2020-14:41:47.732 [SimplePeripheralBusProbe]device   1: ##00 write    6 -  0000: 22 00 38 02 23 00
>>>[0]0000.0000::09/09/2020-14:41:47.740 [SimplePeripheralBusProbe]device   1: ##00 write    6 -  0000: 22 00 37 02 23 00
>>>[0]0000.0000::09/09/2020-14:41:47.741 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 34 03 23 00 04 00 04 03
>>>[0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 36 03 23 00 04 00 06 03
>>>[0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 34 03 23 00 04 00 04 03
>>>[0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 3d 03 23 00 04 00 0d 00
>>>[0]1AB4.3074::09/09/2020-14:41:47.743 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 36 03 23 00 04 00 06 03
>>>
>>
>>Thanks for comparing the 2. As you noticed, there doesn't seem to be
>>any differences.
>>My initial thoughts were that we were wrongly setting the "Latency
>>mode" [0]. But this should have been shown in the differences. I
>>*think* we set it in hid-multitouch, but it can't hurt to do a couple
>>of additional tests on this side.
>
>I think "latency mode" has been correctly set based on the following
>tests,
>
>- When HID_LATENCY_NORMAL is replaced with HID_LATENCY_HIGH when calling
>  mt_set_modes, the cursor would never move even with release_timer
>  disabled.
>
>- hid-generic could take over this device if hid-multitouch is
>  blacklisted. evhz shows the report rate is still only ~7Hz.
>
>- hid-rmi could also handle the device and the report rate is also
>  ~7Hz. According to "Synaptics RMI4 Specification", the control
>  registers has the ReportRate (F01_RMI_Ctrl0, bit 6),
>  > This field sets the report rate for the device. It applies in common to all functions on the
>   device that have a natural report rate.
>
>  When this bit is set, there is no change observed.
>
>I also did some tests on power setting because according to
>"HID Over I2C Protocol Specification" [1], the device's sensing
>frequency could drop to 10Hz in sleep mode,
>>DEVICE reduces its sensing frequency: The DEVICE reduces the frequency
>>at which it scans for data (e.g. if the digitizer does not sense a human
>>finger is present, it samples at 10Hz as compared to 100Hz. However once
>>user interaction is detected, it increases its sensing interval).
>
>- Not power managing the device doesn't work when hid-multitouch
>  handles the device,
>  $ echo "on" | sudo tee /sys/bus/i2c/devices/i2c-MSFT0001:00/power/control
>
>- Set NoSleep (F01_RMI_Ctrl0, bit 2) when hid-rmi handles this device
>
>Unfortunately the above changes didn't bring any improvement. The report rate stays at
>~7Hz.
>
>>
>>The other thing that might explain the difference, is at the I2C
>>level. I see on the dmesg that the touchpad is attached to
>>AMDI0010:03. I wonder if there is not a misconfiguration on the AMD
>>I2C adapter driver that prevents the touchpad from using the correct
>>report rate.
>>
>>Unfortunately, I don't know much about this driver, but maybe given
>>all you showed to me you could have a look too? :)
>>
>>Cheers,
>>Benjamin
>>
>>[0] https://docs.microsoft.com/en-us/windows-hardware/design/component-guidelines/windows-precision-touchpad-required-hid-top-level-collections#latency-mode-feature-report
>>
>
>Thank you for pointing me to another direction!
>
>AMDI0010 is handled by i2c-designware (drivers/i2c/busses/i2c-designware-platdrv.c),
>
>    $ sudo i2cdetect -l
>    i2c-0   i2c             Synopsys DesignWare I2C adapter         I2C adapter
>
>The crucial set parameters when configuring the I2C adapter seems to
>be the I2C related timing parameters. Firmware doesn't provide the
>values (i2c_parse_fw_timings doesn't find any device properties). The
>I2C adapter uses the following set of values,
>
>    clock-frequency: 400000
>    i2c-scl-rising-time-ns: 0
>    i2c-scl-falling-time-ns: 0
>    i2c-scl-internal-delay-ns: 0
>    i2c-sda-falling-time-ns: 0
>    i2c-sda-hold-time-ns: 0
>    i2c-digital-filter-width-ns: 0
>    i2c-analog-filter-cutoff-frequency: 0
>
>For now I don't have sufficent knowledge to tell what may be wrong.
>So I studied several cases of I2C adapter configuration causing touchpad
>issues,
> - i2c: designware: Do not use parameters from ACPI on Dell Inspiron 7348 - Patchwork [2]
> - [BUG] i2c-hid: ELAN Touchpad does not work on ASUS X580GD - Patchwork [3]
> - LKML: Chris Chiu: Tweak I2C SDA hold time on GemniLake to make touchpad work
>
>But I couldn't find a similar case to touchpad having low report rate
>due to a misconfiguration of I2C adapter.
>
>Some unsuccessful attempts are
> - Set acpi_osi to Windows like "Windows 2015"
> - Set I2C bus speed to the standard mode (clock-frequency: 100000)
>   doesn't change anything and set it to high speed mode make cause
>   touchpad to be not recognized.
>
>I'll try another expedient way of finding out what are the values of
>I2C related timing parameters under Windows and setting the same values
>under Linux. If this fails, it seems I need to try the hard way to
>understand how I2C bus work by reading materials like NXP
>Semiconductors's I2C manual.
>
>I'm not sure if it's worth looking at yet another direction, i.e., to check
>if there's something wrong with the touchpad device's interrupt setting
>up. Here's the ACPI dump of the I2C controller and the touchpad device,
>
>        Device (I2CD)
>        {
>            Name (_HID, "AMDI0010")  // _HID: Hardware ID
>            Name (_UID, 0x03)  // _UID: Unique ID
>            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>            {
>                IRQ (Edge, ActiveHigh, Exclusive, )
>                    {6}
>                Memory32Fixed (ReadWrite,
>                    0xFEDC5000,         // Address Base
>                    0x00001000,         // Address Length
>                    )
>            })
>
>        }
>
>    Scope (_SB.I2CD)
>    {
>        Device (TPDD)
>        {
>            Name (_HID, "XXXX0000")  // _HID: Hardware ID
>            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
>            Name (_SUB, "XXXX0000")  // _SUB: Subsystem ID
>            Method (_INI, 0, NotSerialized)  // _INI: Initialize
>            {
>                If ((TPTY == One))
>                {
>                    _HID = "MSFT0001"
>                    _SUB = "ELAN0001"
>                }
>
>                If ((TPTY == 0x02))
>                {
>                    _HID = "MSFT0001"
>                    _SUB = "SYNA0001"
>                }
>
>                Return (Zero)
>            }
>
>            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>            {
>                If ((TPTY == One))
>                {
>                    Name (SBFB, ResourceTemplate ()
>                    {
>                        I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
>                            AddressingMode7Bit, "\\_SB.I2CD",
>                            0x00, ResourceConsumer, , Exclusive,
>                            )
>                    })
>                }
>
>                If ((TPTY == 0x02))
>                {
>                    Name (SBFS, ResourceTemplate ()
>                    {
>                        I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
>                            AddressingMode7Bit, "\\_SB.I2CD",
>                            0x00, ResourceConsumer, , Exclusive,
>                            )
>                    })
>                }
>
>                Name (SBFI, ResourceTemplate ()
>                {
>                    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
>                        )
>                        {   // Pin list
>                            0x0082
>                        }
>                })
>                If ((TPTY == One))
>                {
>                    Return (ConcatenateResTemplate (SBFB, SBFI))
>                }
>
>                If ((TPTY == 0x02))
>                {
>                    Return (ConcatenateResTemplate (SBFS, SBFI))
>                }
>            }
>
>        }
>    }
>
>
>Best regards,
>Coiby
>
>[1] https://docs.microsoft.com/en-us/previous-versions/windows/hardware/design/dn642101(v=vs.85)?redirectedfrom=MSDN
>[2] https://lore.kernel.org/patchwork/patch/601043/
>[3] https://lore.kernel.org/patchwork/patch/903152/
>[4] https://lkml.org/lkml/2019/9/3/191

--
Best regards,
Coiby

--afvcpm7vfj6w6dcw
Content-Type: application/pdf
Content-Disposition: attachment;
	filename="handler_irq7_touchpad_interrupt.pdf"
Content-Transfer-Encoding: base64

JVBERi0xLjUKJbXtrvsKNCAwIG9iago8PCAvTGVuZ3RoIDUgMCBSCiAgIC9GaWx0ZXIgL0Zs
YXRlRGVjb2RlCj4+CnN0cmVhbQp4nJ1YS28bNxC+768g0It00ITvx7VA0SZAD051S3IwYidt
YLuJkqD5+R2SO1xS0ZJrwfBKHM6Q38d57FCCcfw7CHxIYdn7x+nLxJPs9e/sxS1nH79OHAz7
D6Wv8P/T9OYd48DZ3aTAsz/ZFyaSen6iveKggmfCc/BcsEemNNgQiuCB/cVupp/NtAGrWzsB
ysgzwwzu9JH9epx8Bo9GAQTqISIuOZfs+Di9+HDgh7j+8cP0Zsf2B7Xj+3fHV9Nvx4XgKnjt
QJoKex6PoC9WM/La7DJwiYpMGI56K8j5/mB2ILdjFyphXsDPghH6ym6G3xj28AsLbu3kM369
GT96WyCcAn8eD9BXVhl8Y9bBjkEj+kdvN0PXFiwuVKDP4wH0yipDb8w60HWIej3ofnvU4DHU
0OfxKGYWqzlkarNOqtqotp6pYjvupVzMAmdhPVMpRdLHYmNGcS4dcIzzgIezFiwbK4wVEHSo
cJOgh5t0CDeNh7ixsBDuILkWK7hNfPwQMWYyBQuacxUygEMZOaxTuJqoVtu5/fFTn3JQoBvK
JOhRJh2iTOMhZS/ADCgjUbuFruAC3DlfP+QrsOYvZNOoxzQpEM00GHIUPICTW1hCdm1Kqj5X
hVUnLflctiZyq/jmcZdxVimc83DMWiPbPmcZfZrZLvm4xthqcNcQ9h6TStSUSdIlTUqFNgnG
xJ0E5wbuTtSju3UKbTsgH/DlcQ17iQXcNOyLpMe+KBH7IhjXXu6w6vbJq2f4XWIx91cQNyK9
2yriJOkSJ6VCnARj4sqAH2W5at0+qGjSyrlwPJe9l6kpqdiTpMuelAp7Emx45fJUfAevLv0j
kt7g9YDAryCuhE6NZNVokKTbaZBSaTVIMCYePPhRtifq0Ly7BxmvpJmLyHNP4MLNbJZ0T6Dc
K+gESDA8AaUUbDkAs9H3yigIVxBvukWFuGPm2IDLSna679VrjvtJgc+VLvf4z+M9e7t7itC/
vt0n8Kguo9+lAqUVfjneoeYfUeX26e7hfq93J/bydcz0m19c6TTBeCQp495YLZzGmopkRLqz
/0xJBvBIRsr0gU7B137sq6SYr0ukgeU5sl4N7+Sh2erCMhetnM+5r+aIcCEFVLk00Lzs/VCA
SqkRpKvH+SIrHYcDlbWo5/Cx5yCjMt/dOmqJ+tpztsrlEohH02wtlauNynx366jVbH22yoqX
zLKtipeu+maXZrubxppVne2FNfrvLoOZB3wtBfbW7/79/j7G99+fb+/2asdePn2Lw/vT6ftn
DPdv1XUKrAiW4/qgDUdCGON8JcZzbCpZxaVaP6Pz+6/ITVk5pWYexzZVgWraFPUpz5/bm2Zs
65tz9EI9Vy90ZhiTozbEuE9hU34dQ0HQoY1pDJmplfjGJgawro2qaF0E1YV1SiJHeUwcME5M
IzBNkxglvumeHqYqdq4tvjfT/5PVIogKZW5kc3RyZWFtCmVuZG9iago1IDAgb2JqCiAgIDEw
ODMKZW5kb2JqCjMgMCBvYmoKPDwKICAgL0V4dEdTdGF0ZSA8PAogICAgICAvYTAgPDwgL0NB
IDEgL2NhIDEgPj4KICAgPj4KICAgL0ZvbnQgPDwKICAgICAgL2YtMC0wIDYgMCBSCiAgID4+
Cj4+CmVuZG9iagoyIDAgb2JqCjw8IC9UeXBlIC9QYWdlICUgMQogICAvUGFyZW50IDEgMCBS
CiAgIC9NZWRpYUJveCBbIDAgMCAzNjAgMjE2IF0KICAgL0NvbnRlbnRzIDQgMCBSCiAgIC9H
cm91cCA8PAogICAgICAvVHlwZSAvR3JvdXAKICAgICAgL1MgL1RyYW5zcGFyZW5jeQogICAg
ICAvSSB0cnVlCiAgICAgIC9DUyAvRGV2aWNlUkdCCiAgID4+CiAgIC9SZXNvdXJjZXMgMyAw
IFIKPj4KZW5kb2JqCjcgMCBvYmoKPDwgL0xlbmd0aCA4IDAgUgogICAvRmlsdGVyIC9GbGF0
ZURlY29kZQogICAvTGVuZ3RoMSAxMDIyOAo+PgpzdHJlYW0KeJztOmlwG9d5771dLMADIECc
JChywQVAilhSpAAekigKwkGQ4iGQIiWAkkiApCTqoERZii3ZiaREsWzT8RHJyThx41HcpEnb
uLOg4tRum4kyOerKmSbtOJ6m9US208y4rdvJ9EjdTgX2+3YBHrLlTDv92cUs3vfe+9573/19
DyShhJBScolwRJyZzy686Xz+dwmxfoMQNjFz/1mxh3cHCHEYCKHy4YUj8893VP01Ic4QISb7
kRPnD7/3XsVt2AHwrWTuUHa2+smBvyPENwhjHXMwUH5DD3O+T0PfOzd/9tyup/XL0P869J8+
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
Y3JpcHRvcgogICAvRm9udE5hbWUgL0dJVVBURytOb3RvU2Fucy1SZWd1bGFyCiAgIC9Gb250
RmFtaWx5IChOb3RvIFNhbnMpCiAgIC9GbGFncyAzMgogICAvRm9udEJCb3ggWyAtNjIxIC0z
ODkgMjgwMCAxMDY3IF0KICAgL0l0YWxpY0FuZ2xlIDAKICAgL0FzY2VudCAxMDY5CiAgIC9E
ZXNjZW50IC0yOTMKICAgL0NhcEhlaWdodCAxMDY3CiAgIC9TdGVtViA4MAogICAvU3RlbUgg
ODAKICAgL0ZvbnRGaWxlMiA3IDAgUgo+PgplbmRvYmoKNiAwIG9iago8PCAvVHlwZSAvRm9u
dAogICAvU3VidHlwZSAvVHJ1ZVR5cGUKICAgL0Jhc2VGb250IC9HSVVQVEcrTm90b1NhbnMt
UmVndWxhcgogICAvRmlyc3RDaGFyIDMyCiAgIC9MYXN0Q2hhciAxMjAKICAgL0ZvbnREZXNj
cmlwdG9yIDExIDAgUgogICAvRW5jb2RpbmcgL1dpbkFuc2lFbmNvZGluZwogICAvV2lkdGhz
IFsgMjYwIDAgMCA2NDYgMCAwIDAgMCAzMDAgMzAwIDAgMCAwIDAgMjY4IDAgNTcyIDU3MiA1
NzIgNTcyIDU3MiA1NzIgNTcyIDU3MiA1NzIgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAw
IDAgNzQxIDMzOSAwIDAgMCAwIDAgMCAwIDc4MSA2MjIgMCA1NTYgMCAwIDAgMCAwIDAgMCAw
IDAgMCAwIDAgNTYxIDAgNDgwIDYxNSA1NjQgMCAwIDYxOCAyNTggMCAwIDI1OCA5MzUgNjE4
IDYwNSA2MTUgMCA0MTMgNDc5IDM2MSA2MTggMCAwIDUyOSBdCiAgICAvVG9Vbmljb2RlIDkg
MCBSCj4+CmVuZG9iagoxIDAgb2JqCjw8IC9UeXBlIC9QYWdlcwogICAvS2lkcyBbIDIgMCBS
IF0KICAgL0NvdW50IDEKPj4KZW5kb2JqCjEyIDAgb2JqCjw8IC9Qcm9kdWNlciAoY2Fpcm8g
MS4xNy4zIChodHRwczovL2NhaXJvZ3JhcGhpY3Mub3JnKSkKICAgL0NyZWF0aW9uRGF0ZSAo
RDoyMDIwMDkyNDE1MDEwMSswOCcwMCkKPj4KZW5kb2JqCjEzIDAgb2JqCjw8IC9UeXBlIC9D
YXRhbG9nCiAgIC9QYWdlcyAxIDAgUgo+PgplbmRvYmoKeHJlZgowIDE0CjAwMDAwMDAwMDAg
NjU1MzUgZiAKMDAwMDAwODk3OCAwMDAwMCBuIAowMDAwMDAxMzA3IDAwMDAwIG4gCjAwMDAw
MDExOTggMDAwMDAgbiAKMDAwMDAwMDAxNSAwMDAwMCBuIAowMDAwMDAxMTc1IDAwMDAwIG4g
CjAwMDAwMDg1MTEgMDAwMDAgbiAKMDAwMDAwMTUyNSAwMDAwMCBuIAowMDAwMDA3NzMwIDAw
MDAwIG4gCjAwMDAwMDc3NTMgMDAwMDAgbiAKMDAwMDAwODIxMyAwMDAwMCBuIAowMDAwMDA4
MjM2IDAwMDAwIG4gCjAwMDAwMDkwNDMgMDAwMDAgbiAKMDAwMDAwOTE2MCAwMDAwMCBuIAp0
cmFpbGVyCjw8IC9TaXplIDE0CiAgIC9Sb290IDEzIDAgUgogICAvSW5mbyAxMiAwIFIKPj4K
c3RhcnR4cmVmCjkyMTMKJSVFT0YK

--afvcpm7vfj6w6dcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=handler_irq7

76230065 1 78376776 1
201043147 1 203136221 1
326345258 1 328457259 1
451046175 1 453267896 1

--afvcpm7vfj6w6dcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=touchpad_interrupt

10499 0
927527 0
944417 0
962423 0
975820 0
994176 0
011135 0
028513 0
046240 0
0063199 0
1080926 0
2097955 0
3157657 0
4172730 0
5192413 0
6209721 0
7222420 0
8236236 0
9253684 0
0270573 0
1289348 0
2306796 0
3323685 0
4341482 0
5358161 0
6587577 0
7606771 0
8950937 0
0221629 0
1240055 0
2257922 0
3630862 0
4649636 0
5666945 0
6896640 0
7915974 0
8933142 0
9950101 0
0967549 0
2198502 0
3436788 0
4455143 0
5472591 0
6821925 0
7840281 0
8858287 0
0213208 0
1231704 0
2249291 0
3659038 0
4678790 0
5695749 0
7048645 0
58068537 0
59085845 0
60102804 0
61120252 0
62136582 0
63359154 0
64377929 0
65395167 0
66744641 0
67762438 0
69108978 0
70384908 0
71403334 0
72420712 0
73437531 0
74456026 0
75472636 0
76535341 0
77550275 1
78565278 0
79583704 0
80600034 0
81613571 0
82632276 0
83650213 0
84668080 0
85681546 0
86694175 0
87740188 0
88759871 0
89776551 0
90793998 0
91825694 0
92840208 0
93852977 0
94986990 0
96013517 0
97030895 0
98044990 0
99064184 0
100081073 0
101099429 0
102111779 0
103337842 0
104360947 0
105378814 0
106395843 0
107410218 0
108424733 0
109441761 0
110639190 0
111661387 0
112678835 0
113695864 0
114711636 0
115729433 0
116747369 0
117761185 0
118778284 0
119795034 0
120814367 0
121832234 0
122848704 0
124012400 0
125252152 0
126505035 0
127522972 0
128881664 0
130117017 0
131137328 0
132154217 0
133504110 0
134521907 0
135539215 0
136891552 0
137909279 0
138926238 0
140275781 0
141295603 0
142313051 0
143654912 0
144673058 0
145690925 0
146707675 0
147725541 0
148742500 0
149759459 0
150777187 0
151794215 0
153024260 0
154048762 0
155066559 0
156416521 0
157435715 0
158894211 0
160134941 0
161152878 0
162500535 0
163826472 0
165066714 0
166302625 0
167378390 0
168600613 0
169957839 0
170975775 0
172321826 0
173589585 0
174607871 0
175624900 0
176970462 0
177988748 0
179006336 0
180360069 0
181378565 0
182397829 0
183414648 0
184432445 0
185448915 0
186674490 0
187692916 0
188709944 0
190066192 0
191083989 0
192425291 0
193680269 0
194698695 0
195716073 0
196732892 0
197749991 0
198766950 0
199998252 0
201016468 0
202067719 1
203081814 0
204111554 0
205140107 0
206192755 0
207206920 0
208226742 0
209269822 0
210289086 0
211307930 0
212325797 0
213339125 0
214359506 0
215377303 0
216394122 0
217408776 0
218456116 0
219477755 0
220492269 0
221510765 0
222556358 0
223582816 0
224600613 0
225613172 0
226631458 0
227648417 0
228665725 0
229679122 0
230691402 0
231705916 0
232718894 0
233735853 0
234752812 0
235770330 0
236786870 0
237807111 0
238824000 0
239840959 0
240859245 0
242145791 0
243385335 0
244404040 0
245421418 0
246779970 0
247797697 0
249022504 0
250324555 0
251342701 0
252360638 0
253377178 0
254395045 0
255412283 0
256651547 0
257669344 0
259155637 0
260394481 0
261414234 0
262432240 0
263449339 0
264464273 0
265481092 0
266718051 0
267735848 0
268752947 0
270315925 0
271333862 0
272351309 0
273723621 0
274744281 0
275761590 0
276778548 0
277796904 0
278814003 0
280039438 0
281057864 0
282075242 0
283428417 0
284447261 0
285790030 0
287017979 0
288036405 0
289054831 0
290071650 0
291088958 0
292105917 0
293336241 0
294354737 0
295372045 0
296722216 0
297740014 0
298960630 0
300320160 0
301337957 0
302355265 0
303705228 0
304723444 0
305740473 0
306757711 0
307775648 0
308793445 0
310091235 0
311109102 0
312126061 0
313477560 0
314496474 0
315514691 0
316863186 0
317881682 0
318899199 0
320406025 0
321423892 0
322441340 0
323460115 0
324478191 0
325495220 0
326564560 0
327611620 1
328632700 0
329653849 0
330668853 0
331682459 0
332700745 0
333718263 0
334732428 0
335746105 0
336758175 0
337768429 0
338783502 0
339797877 0
340809109 0
341824322 0
342838208 0
343849440 0
344867307 0
345886082 0
346900317 0
347917765 0
348935212 0
349951752 0
350964661 0
352082191 0
353107182 0
354127912 0
355145360 0
356161062 0
357175227 0
358192535 0
359423767 0
360454485 0
361472352 0
362485050 0
363504454 0
364522321 0
365539769 0
366553305 0
367570614 0
368588061 0
369605858 0
370619465 0
371648297 0
372666094 0
373683332 0
374701199 0
375718647 0
376735257 0
377753054 0
378769873 0
379786762 0
380803721 0
381822077 0
383051982 0
384075157 0
385093094 0
386324815 0
387352739 0
388371513 0
389722384 0
390783692 0
392014016 0
393373407 0
394391902 0
395740887 0
397009344 0
398029097 0
399046964 0
400063922 0
401080742 0
402097631 0
403329212 0
404347568 0
405695016 0
406962286 0
407980642 0
408998020 0
410404623 0
411423957 0
412441265 0
413458154 0
414476300 0
415494237 0
416727704 0
417746479 0
418763927 0
420120664 0
421138949 0
422155978 0
423509502 0
424527649 0
425545166 0
426896316 0
427914742 0
428932189 0
430303174 0
431321879 0
432340165 0
433691524 0
434710718 0
435728096 0
436746032 0
437763899 0
438780998 0
440011671 0
441029608 0
442047056 0
443638878 0
444656745 0
445674682 0
447026809 0
448044746 0
449062473 0
450079502 0
451177267 0
452224887 1
453245547 1
454263833 1
455280652 1
456293840 1

--afvcpm7vfj6w6dcw--
